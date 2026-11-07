# who is the senior most employee based on job title;

select employee_id,
concat(first_name,' ',last_name) as name,
title from employee
order by levels desc
limit 1;

# which country have the most invoices?

select billing_country,count(*) as total_invoice
from invoice
group by billing_country
order by count(*) desc
limit 1;

# what are top 3 values of total invoices?

select total from invoice
order by total desc
limit 3; 

# Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
#     Write a query that returns one city that has the highest sum of invoice totals. 
#     Return both the city name & sum of all invoice totals

select billing_city,sum(total) as invoice_total
from invoice
group by billing_city
order by invoice_total desc
limit 1;

#  Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
#      Write a query that returns the person who has spent the most money.

select customer.customer_id,
concat(customer.first_name,'  ',customer.last_name) as name,
round(sum(invoice.total),2) as total
from customer
join invoice on customer.customer_id = invoice.customer_id
group by customer.customer_id,customer.first_name,customer.last_name
order by total desc
limit 1;

#Q6: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
#    Return your list ordered alphabetically by email starting with A.
# method 1

select distinct email,first_name,last_name
from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in (
	select track_id from track
    join genre on track.genre_id = genre.genre_id
    where genre.name like 'rock'
)
order by email;

# method 2

SELECT DISTINCT email AS Email,first_name AS FirstName, last_name AS LastName, genre.name AS Name
FROM customer
JOIN invoice ON invoice.customer_id = customer.customer_id
JOIN invoice_line ON invoice_line.invoice_id = invoice.invoice_id
JOIN track ON track.track_id = invoice_line.track_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
ORDER BY email;

# Q7: Let's invite the artists who have written the most rock music in our dataset. 
#     Write a query that returns the Artist name and total track count of the top 10 rock bands

select artist.artist_id, artist.name, count(artist.artist_id) as number_of_songs
from track
join album on album.album_id = track.album_id
join artist on album.artist_id = artist.artist_id
join genre on genre.genre_id = track.genre_id
where genre.name like 'rock'
group by artist.artist_id,artist.name
order by number_of_songs desc
limit 10;

#Q8: Return all the track names that have a song length longer than the average song length. 
#    Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first.

select name,milliseconds
from track
where milliseconds > (select avg(milliseconds) from track)
order by milliseconds desc;

# Q9: Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent

WITH best_selling_artist AS (
	SELECT artist.artist_id, artist.name, SUM(invoice_line.unit_price*invoice_line.quantity) AS total_sales
	FROM invoice_line
	JOIN track ON track.track_id = invoice_line.track_id
	JOIN album ON album.album_id = track.album_id
	JOIN artist ON artist.artist_id = album.artist_id
	GROUP BY artist.artist_id, artist.name
	ORDER BY total_sales DESC
	LIMIT 1
)
SELECT customer.customer_id, customer.first_name, customer.last_name, best_selling_artist.name, round(SUM(invoice_line.unit_price*invoice_line.quantity),2) AS amount_spent
FROM invoice
JOIN customer ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice_line.invoice_id = invoice.invoice_id
JOIN track ON track.track_id = invoice_line.track_id
JOIN album ON album.album_id = track.album_id
JOIN best_selling_artist ON best_selling_artist.artist_id = album.artist_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name,best_selling_artist.name
ORDER BY 5 DESC;

# Q10: We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre 
#     with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where 
#     the maximum number of purchases is shared return all Genres.

# Steps to Solve:  There are two parts in question- first most popular music genre and second need data at country level.

with popular_genre as
(
select count(invoice_line.quantity) as purchase, customer.country, genre.name, genre.genre_id,
row_number() over(partition by customer.country order by count(invoice_line.quantity) desc) as RowNo
from invoice_line
join invoice on invoice_line.invoice_id = invoice.invoice_id
join customer on customer.customer_id = invoice.customer_id
join track on track.track_id = invoice_line.track_id
join genre on genre.genre_id = track.genre_id
group by customer.country,genre.name,genre.genre_id
order by customer.country asc, purchase desc
)
select * from popular_genre where RowNo <=1;

# Q11: Write a query that determines the customer that has spent the most on music for each country. 
#      Write a query that returns the country along with the top customer and how much they spent. 
#      For countries where the top amount spent is shared, provide all customers who spent this amount.
WITH Customter_with_country AS (
		SELECT customer.customer_id,first_name,last_name,billing_country,round(SUM(total),2) AS total_spending,
	    ROW_NUMBER() OVER(PARTITION BY billing_country ORDER BY SUM(total) DESC) AS RowNo 
		FROM invoice
		JOIN customer ON customer.customer_id = invoice.customer_id
		GROUP BY 1,2,3,4
		ORDER BY 4 ASC,5 DESC
        )
SELECT * FROM Customter_with_country WHERE RowNo <= 1;