# Parking Violations Project 

![Snip20210808_1](https://user-images.githubusercontent.com/24769002/128640756-eebc0094-fc51-4f07-9edc-af04df99cc40.png)


Purpose
------------------------
Los Angeles is the 2nd biggest city in the US per Population. The city is known for having a heavy traffic congestion as well as having a bad public transportation system (Yukana 2021). Owning a car has its privileges unless you have issues finding parking in the city, and Los Agenles is no exception to this issue. Los Angeles is also known for having the highest fines for parking violations (Lee 2019). The following project examines a dataset of parking violations for the city of Los Angeles. The dataset dates back to 2017 and due to the large volume of transactions, we will only be examining data involving the Chrysler vehicle make. The make of the vehicle was chosen at random.

This project is useful in helping cities determine why parking violations were given per the make of the vehicle. It allows city planners to asses parking and to better plan any future layouts of the city involving the use of vehicles.

Datasets
------------------------
For our dataset we our only given the following:
  * parkingLA2017.csv - This dataset details all the parking violations transactions having 1,048,575 and 21 columns.

Feature Definitions
------------------------
Within parkingLA2017 dataset, we also are provided with the following features:
  * Agency - Parking agency ID 
  * Ticket.number - The number idenfyfing the parking violations
  * Issue.Date - The date the violation was given
  * Issue.time - The time (in military) for the given ticket
  * Meter.Id - The ID identifying the meter where the vehicle was stationed
  * Marked.Time - The time the meter was paid
  * RP.State.Plate - State where the vehicle is registered
  * Plate.Expiry.Date - Year and month of when the vehicle is registration is expiring
  * VIN - Vehicle Identification Number
  * Make - The type of model of the vehicle
  * Body.Style - The style of the vehicles body
  * Color - The color of the car such as red, black, blue, etc
  * Location - Address of where the vehicle was parked
  * Route - Highway location
  * Violation.code - The number identifying the violation
  * Violation.Description - A detail explanation as to why the violation was given
  * Fine.amount - The amount that must be paid for the violation
  * Latitude - The angular distance of a place north or south of the earth's equator
  * Longitude - The angular distance of a place east or west 
  * AGENCY.NAME - The agency administering and issuing the ticket
  * AGENCY.SHORT.NAME - Acronym of the agency 

Exploring our Data
------------------------
![Snip20210808_9](https://user-images.githubusercontent.com/24769002/128643030-5d1c63f9-74df-46cf-afdd-62ff639b2361.png)

When exploring the dataset we can see that the histogram displays how the data is allocated per fine amount. Per the above graph, the fine amounts are allocated between $50 and $100. Due to outliers in our data for filtered Chrysler vehicles, we can see that data has a skewness to the right.

![Snip20210808_8](https://user-images.githubusercontent.com/24769002/128643175-22017830-1a56-45c3-b9d7-04b88721dd4b.png)

We can confirm that by looking at our summary of stats in R, the highest parking violation was $363 while the lowest was $25. In reference as to where the median lies, we can see that $68 was the most frequent amount issued on Chrysler vehicles.

![Snip20210808_6](https://user-images.githubusercontent.com/24769002/128643067-163f48b3-fe57-4c03-9e1b-e0699dbd27e8.png)

We can also note that No parking due to Street cleaning was the most frequent parking violation given for Chrysler vehicles. The 2nd common reason for parking violation on Chrysler vehicles was having an expired meter while the 3rd reason was failing to display parking tabs.

![Snip20210808_4](https://user-images.githubusercontent.com/24769002/128643081-370f10b2-af7f-43d2-ab6b-275bba9af391.png)

We can also observe that the Hollywood, BLDG & SAF, Western, and the Valley agencies had the most average fines given in dollar amounts. This means that in 2017, Chrysler vehicles stationed within those specific regions of LA, were most likely to have tp pay more in total per region. All other agencies were equal in terms of the average fines that were given in dollar amounts.

![Snip20210808_3](https://user-images.githubusercontent.com/24769002/128643100-258b2fdc-d7fa-4f02-bc78-3499f19b1a2a.png)

When displaying a violin plot, we can further eloborate as to where the fine amounts are concetrated in dollar value per agency. When we look at Hollywood for example, there is higher probability of having a fine amounts between $90 and $95 dollars. Whereas for the Western agency, you are likely to have a fine within the $90/$95 range or $65/$73 range.   

![Snip20210808_2](https://user-images.githubusercontent.com/24769002/128643182-8d5919c0-0249-4e03-8033-a9657575f8a8.png)

Finally, the above graph gives us an indication on how many parking tickets per description were given throughout the day. Per the above histogram, we can see that the No Parking due street cleaning is mostly given during the times of 7:30 am up until 1:00 pm. This means that street cleanining would take place during 7:30 am and 1:00 pm but also Chrysler vehicles owners failed to move their vehicles in time for a street sweep. The above graph gives agencies a better outlook of when certain violations per description were occuring throughout the day. 

Closing Remarks
------------------------
Our next step would be to implement several prediction models on the future outlook of parking violations for the city of Los Angeles. This would be an important insight for city planners and city officials in terms of understanding on how to plan and also regulating parking in the city of Los Angeles.



References
------------------------
Inoue, Yukana. “Why L.a. Public Transit Is the Worst, and What We Can Do to Improve It.” Los Angeles Loyolan, 9 Mar. 2021, www.laloyolan.com/opinion/why-l-a-public-transit-is-the-worst-and-what-we-can-do-to-improve/article_cc42a382-ddb5-5ae8-8fc6-8af2282689fd.html. 

Lee, Brianna. “There Is Too Much Parking in LA. There Is Too Little Parking in La. Discuss.” LAist, 24 July 2019, 
https://laist.com/news/parking-problems-are-the-bane-of-la-existence-so-lets-brush-up-on-the-basics
