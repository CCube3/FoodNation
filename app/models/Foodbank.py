"""
    Sample Model File

    A Model should be in charge of communicating with the Database.
    Define specific model method that query the database for information.
    Then call upon these model method in your controller.

    Create a model using this template.
"""
from system.core.model import Model


class Foodbank(Model):
    def __init__(self):
        super(Foodbank, self).__init__()

    def login_user(self, data):
        password = data['password']
        queryStr = 'SELECT * FROM user WHERE email = :email'

        data = {'email': data['email']}
        user = self.db.get_one(queryStr, data)
        if user:
            if self.bcrypt.check_password_hash(user.pw_hash, password):
                return {"user": user[0]}
            else:
                return False
        self.db.query_db(queryStr, data)
        return False

    def check_type(self, email):
        queryStr = 'SELECT type FROM user WHERE email = :email LIMIT 1;'
        data = {'email': email}
        check_type = self.db.query_db(queryStr, data)
        return check_type[0]['type']


    def create_user(self, info):
        password = info['password']
        errors = {}

        # if not info['name']:
        #     errors['name'] = "Name cannot be blank"
        # elif len(info['name']) < 2:
        #     errors['name'] = "Name must be at least 2 characters long"
        # if not info['Company/Agency']:
        #     errors['Company/Agency'] = "Entry cannot be blank"
        # elif len(info['Company/Agency']) < 2:
        #     errors['Company/Agency'] = "Entry must be at leadt 2 character long"
        # if not info['Donar/Recipient']:
        #     errors['Donar/Recipient'] = "Please select an option"
        # if not info['address']:
        #     errors['address'] = "Address cannot be blank"
        # if not info['email']:
        #     errors['email'] = 'Email cannot be blank'
        # elif not EMAIL_REGEX.match(info['email']):
        #     errors['email'] = 'Email format must be valid!'
        # if not info['password']:
        #     errors['password'] = 'Password cannot be blank'
        # elif len(info['password']) < 8:
        #     errors['password'] = 'Password must be at least 8 characters long'
        # if not info['pw_confirmation']:
        #     errors['pw_confirmation'] = 'Password confirmation cannot be blank!'
        # elif info['password'] != info['pw_confirmation']:
        #     errors['pw_confirmation'] = 'Password and confirmation must match!'
        # If we hit errors, return them, else return True.
        if errors:
            return {"status": False, "errors": errors}
        else:
            hashed_pw = self.bcrypt.generate_password_hash(password)

            create_address = "INSERT INTO address (address_line_1, address_line_2, city, state, ZIP) VALUES (:address1, :address2, :city, :state, :zip)"
            data = {
            'address1': info['address1'],
            'address2': info['address2'],
            'city': info['city'],
            'state': info['state'],
            'zip': info['zip']
            }
            self.db.query_db(create_address, data)

            query = "SELECT address.id FROM address ORDER BY id DESC LIMIT 1"
            get_address = self.db.query_db(query)
            address_id = get_address[0]['id']


            create_user = "INSERT INTO user (email, pw_hash, name, address_id, type) VALUES (:email, :hashed_pw, :name, :address_id, :type)"
            user_data = {
            'email': info['email'],
            'hashed_pw': hashed_pw,
            'name': info['name'],
            'address_id': address_id,
            'type': info['type']
            }
            register = self.db.query_db(create_user, user_data)
            if register:
                select_users = "SELECT * FROM user WHERE email = :email LIMIT 1"
                user_id = self.db.query_db(select_users, user_data)
                return user_id[0]['id']


    #
    # def login_user(self, info):
    #     password = info['password']
    #     errors = {}
    #
    #     if not info['email']:
    #         errors['lg_email'] = 'Email cannot be blank'
    #     elif not EMAIL_REGEX.match(info['email']):
    #         errors['lg_email'] = 'Email format must be valid!'
    #     if not info['password']:
    #         errors['lg_password'] = 'Password cannot be blank'
    #     elif len(info['password']) < 8:
    #         errors['lg_password'] = 'Password must be at least 8 characters long'
    #
    #     if errors:
    #         return {"status": False, "errors": errors}
    #     else:
    #         user_query = "SELECT * FROM user WHERE email = :email LIMIT 1"
    #         user_data = {'email': info['email']}
    #         user = self.db.get_one(user_query, user_data)
    #         if user:
    #             if self.bcrypt.check_password_hash(user.pw_hash, password):
    #                 return {"status": True, "user":user}
    #             errors['lg_password'] = 'Invalid password'
    #             return {"status": False, "errors": errors}
    #         errors['lg_email'] = 'Invalid email'
    #         return {"status": False, "errors": errors}


    def display_offer(self):
        query = "SELECT offer.type, offer.id, offer.comment, user.name FROM offer JOIN user ON offer.user_id=user.id WHERE user.type = 1 AND !offer.claimed"
        return self.db.query_db(query)


    def send_request(self,request_info):
        query = "INSERT INTO request (type, comment, needed_by, created_at, user_id, updated_at, accepted) VALUES (:food_type, :comment, :needed_by, NOW(), :id, NOW(), :accepted)"
        data = {
        'food_type': request_info['food_type'],
        'comment':request_info['comment'],
        'needed_by': request_info['needed_by'],
        'id': request_info['id'],
        'accepted': 0

        }
        return self.db.query_db(query, data)

    def add_offer(self, info):
        sql = "INSERT INTO offer (type, comment, pickup, created_at, updated_at, user_id, claimed) VALUES (:type, :comment, :pickup, NOW(), NOW(),:user_id, :claimed)"
        data = {
        'type': info['type'],
        'comment': info['comment'],
        'pickup': info['date'],
        'user_id': info['id'],
        'claimed': 0

        }
        self.db.query_db(sql, data)


    def get_request(self):

        return self.db.query_db("SELECT request.type, request.id, request.comment, user.name FROM request JOIN user on request.user_id=user.id WHERE user.type = 2 AND !request.accepted")

    def display_claimed_offer(self):
        return self.db.query_db("SELECT offer.type, offer.id, offer.comment, user.name FROM offer JOIN user ON offer.user_id=user.id WHERE user.type = 1 AND offer.claimed")

    def display_accepted_request(self):
        return self.db.query_db("SELECT request.type, request.id, request.comment, user.name FROM request JOIN user on request.user_id=user.id WHERE user.type = 2 AND request.accepted")

    def claim_offer(self,info):
        query = "UPDATE offer SET claimed = :claimed WHERE id = :id"
        data = {
        'claimed': info['user_id'],
        'id': info['offer_id']
        }
        return self.db.query_db(query,data)

    def accept_offer(self, info):
        query = "UPDATE request SET accepted = :accepted WHERE id = :id"
        data = {
        'accepted': info['user_id'],
        'id': info['request_id']
        }
        return self.db.query_db(query,data)


    """
    Below is an example of a model method that queries the database for all users in a fictitious application

    Every model has access to the "self.db.query_db" method which allows you to interact with the database

    def get_users(self):
        query = "SELECT * from users"
        return self.db.query_db(query)

    def get_user(self):
        query = "SELECT * from users where id = :id"
        data = {'id': 1}
        return self.db.get_one(query, data)

    def add_message(self):
        sql = "INSERT into messages (message, created_at, users_id) values(:message, NOW(), :users_id)"
        data = {'message': 'awesome bro', 'users_id': 1}
        self.db.query_db(sql, data)
        return True

    def grab_messages(self):
        query = "SELECT * from messages where users_id = :user_id"
        data = {'user_id':1}
        return self.db.query_db(query, data)

    """
