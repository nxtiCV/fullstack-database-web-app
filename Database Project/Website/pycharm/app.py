from flask import Flask, render_template,request
from queries import *

app = Flask(__name__)

#get all locations and their vehicles
@app.route('/location')
def locations():
    locations = get_rental_locations()
    return render_template('locations.html', locations=locations)

@app.route('/vehicles')
def vehicles():
    locationID = request.args.get('LocationID')
    vehicles = get_vehicles_by_location(locationID)
    return render_template('vehicles.html', vehicles=vehicles, LocationID=locationID)

# get all vehicles and their location
@app.route('/vehicle')
def vehicle():
    vehicle = get_vehicle()
    return render_template('vehicle.html', vehicle=vehicle)


# get all customers and their license info
@app.route('/customer')
def customer():
    customers = get_customers()
    return render_template('customer.html', customers=customers)


# get all rentals and their customer info, status, and vehicle info
@app.route('/rental')
def rental():
    rental = get_rental()
    return render_template('rental.html', rental=rental)


# get all maintenance records and their status and the vehicle
@app.route('/maintenance')
def maintenance():
    maintenance = get_maintenance()
    return render_template('maintenance.html', maintenance=maintenance)


# get all reservation records and their status and customer
@app.route('/reservation')
def reservation():
    reservation = get_reservation()
    return render_template('reservation.html', reservation=reservation)


if __name__ == '__main__':
    app.run(debug=True)

