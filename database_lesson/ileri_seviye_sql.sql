-- Inner Join
select o.id, concat(c.first_name,c.last_name) customername, o.order_date from orders o inner join customers c
on o.customer_id = c.id
where c.city = 'New York'

-- Ikiden cok tablo kullanimi
 select o.id order_id ,sum(od.unit_price * od.quantity) total ,concat(c.first_name,c.last_name)customername, o.order_date from orders o inner join customers c
 on o.customer_id = c.id
 inner join order_details od on od.order_id = o.id
 inner join products p on  p.id=od.product_id
 group by o.id 
 
 -- Left Join
 select c.first_name , o.id as orderid from customers c 
 left join orders o 
 on o.customer_id = c.id
 where o.id is null
 order by c.first_name
 
 select p.id, p.product_name from products p left join order_details od
 on p.id = od.product_id
 where od.id is null
 
 -- Right Join
 select o.id , e.first_name from orders o right join employees e
 on o.employee_id = e.id
 where o.id is null
 order by o.id