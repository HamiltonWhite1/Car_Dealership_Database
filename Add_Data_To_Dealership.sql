-- Designed by Justin and Hamilton, but the data is unique to each of us

insert into "customer" (customer_id, first_name, last_name , email, phone_number)
values (1, 'Hamilton', 'White', 'hamiltononaquestforcars@rocketmail.com', 443-223-1293),
		(2, 'Justin', 'Rittenhouse','justinonaquestforcars@hotmail.com', 555-444-333 )

insert into "customer" (customer_id, first_name, last_name , email, phone_number)
values (3, 'Jared', 'Nance', 'jaredonaquestforcars@rocketmail.com', 445-223-1293),
		(4, 'Jesse', 'Hitt','jesseonaquestforcars@hotmail.com', 556-444-333)
		
insert into "salesperson" (salesperson_id, first_name, last_name)
values (1, 'Shannon', 'Twain'),
		(2, 'Johan', 'Cena')

insert into "cars_for_sale" (car_for_sale_id, make, model, color, make_year, salesperson_id)
values (1, 'Toyota', 'Rav-4', 'Blue', 1994, 1),
		(2, 'Ford','Bronco', 'White', 1986, 2)
		
insert into "invoice" (invoice_id, customer_id, salesperson_id, car_for_sale_id, amount)
values (3, 1, 1, 1, 50000.00),
		(4, 1, 1, 1, 50000.00)
		
insert into "car_in_for_service" (car_service_id, make, model, color, make_year, customer_id)
values (1, 'Toyota', 'Camry', 'Gold', 1994, 1),
		(2, 'Honda', 'Accord', 'Black', 2002, 2)
		

insert into "mechanics" (mechanic, first_name, last_name)
values (1, 'Derek', 'Hawkins'),
		(2, 'Lucas', 'Lang')
		
insert into "service_history" (service_ticket_id, mechanic_id, car_id, amount)
values (1, 2, 1, 600.00),
		(2, 1, 2, 450.00)


-- Function designed by Justin and Hamilton to calculate sales tax on cars. Will differ for each of us, due to differing sales tax by state
create function generate_interest(raw_amount decimal)
returns float 
language plpgsql as $$
begin
	return raw_amount + (raw_amount * .0625);
end;
$$

select *, generate_interest(amount) as "Tax Included"
from invoice

insert into "invoice" (invoice_id, customer_id, salesperson_id, car_for_sale_id, amount)
values (5, 2, 1, 2, generate_interest(67500.00))

insert into "invoice" (invoice_id, customer_id, salesperson_id, car_for_sale_id, amount)
values (6, 2, 1, 2, generate_interest(47500.00))


