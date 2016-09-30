"""
    Sample Controller File

    A Controller should be in charge of responding to a request.
    Load models to interact with the database and load views to render them to the client.

    Create a controller using this template
"""
from system.core.controller import *
from flask import escape

class Foodbank(Controller):
    def __init__(self, action):
        super(Foodbank, self).__init__(action)
        self.load_model('Foodbank')
        self.db = self._app.db

    def index(self):
        return self.load_view('index.html')

    def create_user(self):
        session['name'] = request.form['name']
        session['type'] = request.form['type']
        if session['type'] == "Donar":
            session['type'] = 1
        else:
            session['type'] = 2
        password = request.form['password']
        email = request.form['email']
        address1 = request.form['address1']
        address2 = request.form['address2']
        city = request.form['city']
        state = request.form['state']
        zip = request.form['zip']
        print session['type']

        data = {
        'name': session['name'],
        'type': session['type'],
        'password':password,
        'email':email,
        'address1': address1,
        'address2': address2,
        'city':city,
        'state':state,
        'zip':zip
        }
        # self.models['Foodbank'].create_user(data)

        session['id'] = self.models['Foodbank'].create_user(data)
        print "********"
        print session['id']

        if session['type'] == 1:
            requests = self.models['Foodbank'].get_request()
            claimed_offers = self.models['Foodbank'].display_claimed_offer()

            return self.load_view('restaurant_show.html', requests = requests, claimed_offers=claimed_offers)
        else:
            offers = self.models['Foodbank'].display_offer()
            accepted_requests = self.models['Foodbank'].display_accepted_request()
            return self.load_view('foodbank.html', offers=offers, accepted_requests = accepted_requests)

    def login(self):
        post = request.form
        #print post
        email = escape(post['email']).lower()
        password = escape(post['password'])
        # session['id'] = self.models['Foodbank'].create_user(data)

    # test for post data
        if 'email' in post and 'password' in post:

        # escape inputs
            data = {
                'email' : escape(post['email']).lower(),
                'password' : escape(post['password'])
            }
            print email
            print password

        # test for valid inputs
            if email and password:

            # see if a user with 'email' exists
                user = self.models['Foodbank'].login_user(data)
                session['id'] = user['user']
                print "********************"
                print user

            # if there is a user with 'email'
                if user:


                # test password
                    #if bcrypt.check_password_hash(user[0]['password'], password):

                    # set session and go to the wall
                        #session['user_id'] = int(user[0]['id'])
                        #session['name'] = user[0]['name']
                        check_type = self.models['Foodbank'].check_type(email)
                        print check_type
                        if check_type == 1:

                            requests = self.models['Foodbank'].get_request()
                            claimed_offers = self.models['Foodbank'].display_claimed_offer()

                            return self.load_view('restaurant_show.html', requests = requests, claimed_offers=claimed_offers)
                        else:

                            offers = self.models['Foodbank'].display_offer()
                            accepted_requests = self.models['Foodbank'].display_accepted_request()
                            return self.load_view('foodbank.html', offers=offers, accepted_requests = accepted_requests)
                flash("Email and password do not match", 'lg_email')

        # set errors for empty inputs
            else:
                if not post['email']: flash("Email cannot be blank", 'lg_email')
                if not post['password']: flash("Password cannot be blank", 'lg_password')

    # if it failed reload the login page
        return redirect('/')



    def request(self):
        return self.load_view('request.html')

    def request_food(self):
        food_type = request.form['type']
        comment = request.form['comment']
        needed_by  = request.form['date']
        request_info = {
        'food_type': food_type,
        'comment': comment,
        'needed_by': needed_by,
        'id': session['id']
        }
        self.models['Foodbank'].send_request(request_info)
        offers = self.models['Foodbank'].display_offer()
        accepted_requests = self.models['Foodbank'].display_accepted_request()
        return self.load_view('foodbank.html',offers = offers,  accepted_requests = accepted_requests)

    # def delete_claim(self, id):
    #     if self.models['Foodbank'].delete_claim():
    #         message = '<div>Your request was claimed by' + str(session['name'])+ 'Would you like to accept it?</div>'
    #         return self.load_view('foodbank.html', message = message)


    def add_food(self):
        return self.load_view('restaurant.html')

    def inputdb(self):
        type = request.form['type']
        comment = request.form['content']
        date = request.form['date']
        info  = {
        'type': type,
        'comment': comment,
        'date': date,
        'id': session['id']
        }
        self.models['Foodbank'].add_offer(info)
        requests = self.models['Foodbank'].get_request()
        claimed_offers = self.models['Foodbank'].display_claimed_offer()

        return self.load_view('restaurant_show.html', requests = requests, claimed_offers=claimed_offers)

    def claim_offer(self,id):
        info = {
        'user_id': session['id'],
        'offer_id': id
        }
        self.models['Foodbank'].claim_offer(info)
        offers = self.models['Foodbank'].display_offer()
        accepted_requests = self.models['Foodbank'].display_accepted_request()
        return self.load_view('foodbank.html', offers=offers, accepted_requests = accepted_requests)

    def accept_offer(self, id):
        info = {
        'user_id': session['id'],
        'request_id': id
        }
        self.models['Foodbank'].accept_offer(info)
        requests = self.models['Foodbank'].get_request()
        claimed_offers = self.models['Foodbank'].display_claimed_offer()

        return self.load_view('restaurant_show.html', requests = requests, claimed_offers=claimed_offers)

    def logout(self):
        session.pop('name', None)
        session.pop('id', None)
        return redirect('/')
