-- Hangi urun kac tane satilmis ?
select p.id, p.product_name, count(*) adet from products p inner join order_details od 
on p.id = od.product_id
group by p.id
order by adet
-- En cok kazandiran ilk 3 urun hangileridir ?
select p.id, p.product_name, sum(od.quantity* od.unit_price) as kazanc from products p inner join order_details od
on p.id = od.product_id
group by p.id
order by kazanc desc
limit 3

-- Hangi kargo sirketlerine toplam ne kadar odeme yapilmis ?
select s.company, sum(o.shipping_fee) as total from orders o inner join shippers s 
on s.id = o.shipper_id
group by s.id
order by total
-- En uygun kargo ucreti hangisidir ?
select s.company, avg(o.shipping_fee) total from orders o inner join shippers s 
on s.id = o.shipper_id
where o.shipping_fee is not null
group by s.id
having count(o.id) > 10


-- Secilen kayitlatin tabloya eklenmesi 
insert into employee_performance(employee_id,fullname, email, satis_adet)
select e.id, concat(e.first_name,' ', e.last_name) as fullname, e.email_address, count(o.id) as adet from 
employees e left join orders o 
on e.id = o.employee_id
group by e.id

-- Join ile UPDATE
update employees e inner join employee_performance ep
on e.id = ep.employee_id
set e.email_address = ep.email
where ep.email like '%updated%'
-- Join ile DELETE
-- siparisi olmayan musterileri siliniz
select c.id,c.first_name from customers c 
left join orders o 
on c.id = o.customer_id
where o.customer_id is null 

delete customers
from customers  left join orders 
on  customers.id= orders.customer_id
where orders.customer_id is null and customers.id=13

-- union ile calisma

select email from employee_performance
union all
select email_address from employees

-- Alt Sorgular
select id,order_date from orders
where status_id = (select id from orders_status where status_name = 'Closed')


select id, product_name from products 
where id in (select product_id from order_details where quantity > 100)

-- Exist Operatoru 
select id,first_name from customers c
where EXISTS (select id from orders o where c.id = o.customer_id and payment_type = 'Credit Card')


select id,first_name,last_name from customers c
where EXISTS 
( select count(*) from orders o
where c.id = o.customer_id
group by o.customer_id
having count(*)>2)

-- Any & All Operatorleri 
select id, product_name, list_price from products
where id in (2,3,5,10)   --  hepsi gelirken

select id, product_name, list_price from products
where id = any (select product_id from order_details where quantity > 10)  -- sadece bir tanesinin olmasi yeterli yani OR operatoru

select id, product_name, list_price from products
where id > all (select product_id from order_details where quantity > 10)  -- AND opeartoru gibi 

select * from customers2
where salary > any (select avg(salary) from customers2)



















