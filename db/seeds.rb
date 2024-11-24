# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# rubocop:disable Metrics/BlockLength
ActiveRecord::Base.transaction do
  admin = User.create!(
    username: Rails.application.credentials.site_admin[:username],
    password: Rails.application.credentials.site_admin[:password],
    email: Rails.application.credentials.site_admin[:email],
    admin: true,
  )

  author_1 = Author.create!(
    name: "Sleve McDichael",
    bio: "Sleve covers sports for the AI Times.",
    education: "B.S. Sports History, Blue Mountain State",
    created_at: "2021-02-13 00:07:02 UTC",
    updated_at: "2021-02-13 00:07:02 UTC",
  )

  author_2 = Author.create!(
    name: "Onson Sweemey",
    bio: "Onson covers politics for the Times. Onson is also a distinguished chair at the Center for Resources and American Politics.",
    education: "Ph.D. Political Scientology, Greendale Community College",
    created_at: "2021-02-13 00:07:02 UTC",
    updated_at: "2021-02-13 00:07:02 UTC",
  )

  author_3 = Author.create!(
    name: "Rey McSriff",
    bio: "Rey covers all thing business and tech.",
    education: "M.Bs.A, Pennbrook University",
    created_at: "2021-02-13 00:07:02 UTC",
    updated_at: "2021-02-25 22:44:36 UTC",
  )

  author_4 = Author.create!(
    name: "Willie Dustice",
    bio: "Willie reports on U.S. news",
    education: "Studied Journalism on YouTube",
    created_at: "2021-02-13 00:07:02 UTC",
    updated_at: "2021-02-13 00:07:02 UTC",
  )

  photo_1 = Photo.create!(
    alt_text: "United States White House",
    title: "White House",
    source_url: "https://farm3.static.flickr.com/2503/4217661984_fec1fcdf69_m.jpg",
    photographer_name: "Tom Lohdan",
    photographer_url: "https://www.flickr.com/people/tom_lohdan/",
    license_type: "CC BY 2.0",
    license_url: "https://creativecommons.org/licenses/by/2.0/",
    created_at: "2021-02-13 00:07:02 UTC",
    updated_at: "2021-03-22 23:35:18 UTC",
  )

  photo_2 = Photo.create!(
    alt_text: "Oil Rig",
    title: "oil rig",
    source_url: "https://www.flickr.com/photos/tsuda/992914260/",
    photographer_name: "tsuda",
    photographer_url: "https://www.flickr.com/people/tsuda/",
    license_type: "CC BY-SA 2.0",
    license_url: "https://creativecommons.org/licenses/by-sa/2.0/",
    created_at: "2021-03-22 04:28:07 UTC",
    updated_at: "2021-03-23 00:25:19 UTC",
  )

  photo_3 = Photo.create!(
    alt_text: "Charging Bull Statue",
    title: "Charging Bull - New York City",
    source_url: "https://www.flickr.com/photos/132084522@N05/17086570218/",
    photographer_name: "Arch_Sam",
    photographer_url: "https://www.flickr.com/people/132084522@N05/",
    license_type: "CC BY 2.0",
    license_url: "https://creativecommons.org/licenses/by/2.0/",
    created_at: "2021-03-22 04:37:13 UTC",
    updated_at: "2021-03-23 00:19:38 UTC"
  )

  photo_4 = Photo.create!(
    alt_text: "Newspaper Jobs Classifieds",
    title: "Job Listing",
    source_url: "https://www.flickr.com/photos/124247024@N07/13903388778/",
    photographer_name: "flazingo_photos",
    photographer_url: "https://www.flickr.com/people/124247024@N07/",
    license_type: "CC BY-SA 2.0",
    license_url: "https://creativecommons.org/licenses/by-sa/2.0/",
    created_at: "2021-03-22 04:41:21 UTC",
    updated_at: "2021-03-23 00:26:30 UTC",
  )

  photo_5 = Photo.create!(
    alt_text: "U.S. Capitol Building",
    title: "2020.02.16 Cocktail Attire Only, Washing",
    source_url: "https://www.flickr.com/photos/taedc/49543527726/",
    photographer_name: "tedeytan",
    photographer_url: "https://www.flickr.com/people/taedc/",
    license_type: "CC BY-SA 2.0",
    license_url: "https://creativecommons.org/licenses/by-sa/2.0/",
    created_at: "2021-03-22 04:47:18 UTC",
    updated_at: "2021-03-23 00:18:42 UTC",
  )

  photo_6 = Photo.create!(
    alt_text: "US Senate Building",
    title: "US Senate Building",
    source_url: "https://www.flickr.com/photos/larry1732/8621432655/",
    photographer_name: "Larry Lamsa",
    photographer_url: "https://www.flickr.com/people/larry1732/",
    license_type: "CC BY 2.0",
    license_url: "https://creativecommons.org/licenses/by/2.0/",
    created_at: "2021-03-22 04:50:51 UTC",
    updated_at: "2021-03-23 00:03:16 UTC",
  )

  photo_7 = Photo.create!(
    alt_text: "Houston Texans Football Field",
    title: "First NFL football game 008",
    source_url: "https://www.flickr.com/photos/krisandapril/51403649/",
    photographer_name: "thisgeekredes",
    photographer_url: "https://www.flickr.com/people/krisandapril/",
    license_type: "CC BY 2.0",
    license_url: "https://creativecommons.org/licenses/by/2.0/",
    created_at: "2021-03-22 05:08:20 UTC",
    updated_at: "2021-03-23 00:01:58 UTC",
  )

  photo_8 = Photo.create!(
    alt_text: "Gonzaga Basketball Team",
    title: "Gonzaga",
    source_url: "https://www.flickr.com/photos/chris-yunker/3366176129/",
    photographer_name: "ChrisYunker",
    photographer_url: "https://www.flickr.com/people/chris-yunker/",
    license_type: "CC BY 2.0",
    license_url: "https://creativecommons.org/licenses/by/2.0/",
    created_at: "2021-03-22 05:11:49 UTC",
    updated_at: "2021-03-23 00:25:03 UTC",
  )

  photo_9 = Photo.create!(
    alt_text: "MMA Fighters In Cage",
    title: "658651445519884821",
    source_url: "https://www.flickr.com/photos/alzersey/6178361367/",
    photographer_name: "Alzersey",
    photographer_url: "https://www.flickr.com/people/alzersey/",
    license_type: "CC BY 2.0",
    license_url: "https://creativecommons.org/licenses/by/2.0/",
    created_at: "2021-03-22 05:14:36 UTC",
    updated_at: "2021-03-23 00:12:30 UTC",
  )

  photo_10 = Photo.create!(
    alt_text: "Lottery Tickets",
    title: "Day Two hundred and seven: It\u2019s nice to",
    source_url: "https://www.flickr.com/photos/belkut/4940893730/",
    photographer_name: "Insulinde",
    photographer_url: "https://www.flickr.com/people/belkut/",
    license_type: "CC BY-SA 2.0",
    license_url: "https://creativecommons.org/licenses/by-sa/2.0/",
    created_at: "2021-03-22 05:17:29 UTC",
    updated_at: "2021-03-23 00:18:42 UTC",
  )

  photo_11 = Photo.create!(
    alt_text: "Accident Crime Scene",
    title: "Englewood Accident - Crime Scene Tape 1",
    source_url: "https://www.flickr.com/photos/z0/5116307752/",
    photographer_name: "Aranami",
    photographer_url: "https://www.flickr.com/people/z0/",
    license_type: "CC BY 2.0",
    license_url: "https://creativecommons.org/licenses/by/2.0/",
    created_at: "2021-03-22 05:21:45 UTC",
    updated_at: "2021-03-23 00:02:51 UTC",
  )

  photo_12 = Photo.create!(
    alt_text: "US Officials with Saudi Royals",
    title: "President Trump\u2019s Trip Abroad",
    source_url: "https://www.flickr.com/photos/whitehouse45/34784285005/",
    photographer_name: "The Trump White House Archived",
    photographer_url: "https://www.flickr.com/people/whitehouse45/",
    license_type: "Public Domain",
    license_url: "https://creativecommons.org/publicdomain/mark/1.0/",
    created_at: "2021-03-22 05:26:38 UTC",
    updated_at: "2021-03-23 00:04:50 UTC",
  )

  photo_13 = Photo.create!(
    alt_text: "Olympic Torch",
    title: "Olympic Torch",
    source_url: "https://www.flickr.com/photos/29237715@N05/6795882180/",
    photographer_name: "Noel Reynolds",
    photographer_url: "https://www.flickr.com/people/29237715@N05/",
    license_type: "CC BY 2.0",
    license_url: "https://creativecommons.org/licenses/by/2.0/",
    created_at: "2021-03-23 00:40:01 UTC",
    updated_at: "2021-03-23 00:40:01 UTC",
  )

  photo_14 = Photo.create!(
    alt_text: "Sport Stadium Seating",
    title: "One of Fifty Thousand",
    source_url: "https://www.flickr.com/photos/oneterry/50586275237/",
    photographer_name: "Terry Kearney",
    photographer_url: "https://www.flickr.com/people/oneterry/",
    license_type: "Public Domain",
    license_url: "https://creativecommons.org/publicdomain/zero/1.0/",
    created_at: "2021-03-23 00:50:39 UTC",
    updated_at: "2021-03-23 00:50:39 UTC",
  )

  photo_15 = Photo.create!(
    alt_text: "Empty Classroom Desks",
    title: "final exam",
    source_url: "https://www.flickr.com/photos/dcjohn/74907741/",
    photographer_name: "dcJohn",
    photographer_url: "https://www.flickr.com/people/dcjohn/",
    license_type: "CC BY 2.0",
    license_url: "https://creativecommons.org/licenses/by/2.0/",
    created_at: "2021-03-23 00:56:21 UTC",
    updated_at: "2021-03-23 00:56:21 UTC",
  )

  article_1 = Article.create!(
    title: "National Olymic Committee is Still Debating Over Whether to Cancel the 2021 Summer Games",
    body: "The other two teams do not, but at this point it is clear, as it is already clear, that the Olympic Committee is not an effective representative for the players. It is believed to have a number of reasons \u2014 a shortage of players, competition from other teams and perhaps a need between European squads and the Canadian national team. There is also the fact that, even though the Canadian national team is the only Canadian roster to play in the Nations Cup qualifiers in 2017, it is not capable of consistently playing in the tournament as its roster was a little smaller in 2014. \r\n\r\nCanadian fans would be shocked to see this national team fall short of the CONCACAF Champions League, even if they had been expecting the Canadian squad to finish with their biggest league title yet. The CONCACAF Champions League is the second season in a row the Canadian national team is in, and will see the Canadian squad rise to next level by season's end.\r\n\r\nI had hoped that Canada would come into the tournament as the only Canadian team able to play in the tournament, however, because it already had nine Canadian starters playing on their roster, and the only Canadian team to qualify for the tournament was the Canadian side, who are only two-time Canadian starters. The Canadian teams had to play three different games of the tournament. It is also worth noting that the Canadian national team is still one of three teams in the tournament's lineup, with six each in CONCACAF, and three in CONCACAF and Canada's National Team. \r\n\r\nThe only Canadian team in its lineup that currently has not played will have to play in the tournament's final spot in the tournament if the national team isn't deemed worthy to qualify for the tournament as a team. Other teams in the competition include: Maintaining a solid starting lineup while the defending champions (the Canadian team) have to play their first game of the tournament, which is the final matchup of the four leagues in the CONCACAF (ULD, the American team, the Canadian team and CONCACAF).\r\n    \r\n    \r\n    ",
    section: "sports",
    author_id: author_1.id,
    photo_id: photo_13.id,
    featured: false,
    highlighted: false,
    created_at: "2021-02-15 00:53:06 UTC",
    updated_at: "2021-03-23 00:40:25 UTC",
  )

  article_2 = Article.create!(
    title: "Market Volatility Spurs Creation of New Fund",
    body: "A new alternative fund seeks to capitalize on the frequent volatility spikes occurring now. The fund is called the 'Fusion Fund'.\r\n\r\nFusion, as an acronym for Converting, is a name for new businesses and products that offer higher profits to new customers. The main goal to profit a firm or business through a fund that gives this new product or product is to have a firm stand out and offer a more business friendly fund to buy the products you want.\r\n\r\nWhen you start a business you will only have a portion of the proceeds for the business.\r\n\r\nThe more business friendly and positive investor you can find as you start your fund but you will also be able to get a very good return on investment in your fund, make business with the product or products you wanted or you are now providing. The only costs you to add your funds to your fund are your own financing is needed with the necessary resources.\r\n\r\nTo achieve an excellent return on investment, you will see the good profit in your fund for the benefit of it and you will also be able to pay for investment into marketing, marketing, advertising such as you get it on market to sell...\r\n\r\nGood return on invested capital, it can be very high, to make money now I must admit it, as the investor gets to know the business, good investments is also much more good investment.\r\n\r\nAlthough I can say that you must have your own marketing team, that doesn't mean that it is really like \"the market\" right? That is just the industry description in my mind. In my opinion in a business plan and a good marketing plan, you are much better in business planning and advertising than the investor as it does your investing.\r\n\r\nIn my opinion, a good marketing plan is even better if you don't get to choose your investor. That will take time, you know to be able to find the best partners on the market, that the investors expect you to invest into marketing, marketing, advertising etc. What you will find is the one that is best suited for your marketing needs and your desire to invest early.\r\n\r\nInvesting is your job and right now this one is the focus of all business investors. Since everything else takes time, you cant do it successfully. If you can not be quickly convinced to invest in yourself, make sure to be specific with the investments in mind that you are going for a very quick win-win situation.\r\n\r\nIn general, the marketing and promotion is your friend. It is like a funny saying. All these kinds of messages are all awesome. I wish that the investor was willing to invest in a marketing expert to explain the exact marketing concepts under the supervision of a knowledgeable investor, to help him to understand the services marketing, marketing and promotions. If you don't have the expertise and help in the areas not mentioned above, then I am sure his advice will be helpful to you.\r\n    ",
    section: "business",
    author_id: author_3.id,
    photo_id: photo_3.id,
    featured: false,
    highlighted: true,
    created_at: "2021-02-15 18:13:56 UTC",
    updated_at: "2021-03-22 04:48:30 UTC",
  )

  article_3 = Article.create!(
    title: "Biggest U.S. Oil Refinery Shutting Because of Frigid Weather",
    body: "The U.S. Government, through the US Climate Change Act, and the US National Center for Environmental Information, said in a report September 24 that there is \"no longer \"unnecessary and unavoidable\" emergency response options. Currently, the U.S. Government and the entire Oil and Gas industry are not willing to immediately respond to the impacts of climate change on the nation's petroleum infrastructure. US Conference of State Legislatures released the September 25 report.\r\n\r\n\"We understand that [Conference of State Legislatures] Council of State Legislatures recently released National Geographic Expanding Water Crisis in the Standing Rock Indian Reservation \u2013 U.S. State Department, National Center for Environmental Information, US National Center for Science Information (NCPSA), US Department of State, State Department, U.S. Energy Department, Department of the EPA,\" wrote David Wouters, Director of State, at National Science Foundation.\r\n\r\nIt's not just the fact that current D.I.R. energy policy is driven by a number of factors such as peak demand, global market opportunities, foreign oil and natural gas markets, climate change and energy security.\r\n\r\nWouters told us in a press conference last week that the global water crisis will force the U.S. Congress to reduce public participation in the \"water war.\" The situation has been particularly difficult to cope with a prolonged, long-reported dry spell due to a lack of water supply. However, he said in this example, the water wars in the United States and Europe have also caused the water supply to collapse in its most expensive form because \"a number of people in Central America, the U.S., are now seriously impacted and the war has caused a temporary crisis.\"\r\n\r\nIn addition to cutting people off from water services under a proposed rule, Wouters points to the fact that the U.S. already is an outlier on the water supply curve. \"The U.S. is a population denser than a number of American states, and the problem is exacerbated by the population density and availability of floodwater resources.\"\r\n\r\nWater problems in the United States are not only a growing problem, they are also known to result from global migration of people to cities and in turn, to floods, caused by the depletion of water supplies.\r\n\r\nThe D.A.'s World Population 2018 report highlights recent migration rates. This is the greatest projected threat to the U.S. from the D.A.'s World Water Program: people becoming dependent on waterways for electricity, falling demand for food supplies, increased urbanization and increased physical and political instability.\r\n\r\n\"In the short amount of time that these people have to live, they have to suffer because the food demand and the water availability in the rivers, underground aquifers, will be so high that they will just become literally unwilling to use any water resources. As it turns out, these people are in dire need of more water supplies and better water protection,\" he asserted.\r\n\r\nThe use of the D.A.'s water primarily for agriculture, which currently constitutes the third largest source of water to the U.S. State Department, caused about a 4 percent increase in rainfall in October. The amount was also put at about 5 inches of rainfall in August. Nonetheless, D.A.'s water supply is currently at the lowest standard it has been in more than 40 years. The D.A. is also heavily dependent on groundwater resources because the groundwater is concentrated near homes and partial dumps.\r\n\r\nAdditionally, according to a September 2013 State Department report, it does not \"appropriate for any state to prioritize groundwater development during a wet season.\" In this case, the primary reason is water supply, not human activities. This is often demonstrated when a state has either flooded or levelled water out of a flooded-water basin during a thunderstorm or where the majority of groundwater evaporates into an underground watering hole. The groundwater will subsequently be used even when other factors like climate change will affect it, as did the concentration of fertilizer.\r\n\r\nThough the D.A.'s data are often distorted by the use of \"natural resources,\" each particular type of soil has a natural connection to a particular resource, and they have been heavily suppressed by agricultural industry.\r\n\r\nThe World's Drought Impacts: Reducing soils in Western North America and the effects of increased rainfall as well as a greater distance traveled between crop land and soil in areas impacted by irrigation for a prolonged period in dry years.\r\n\r\nExplore further How rainforests are changing soil moisture distribution\r\n\r\nMore information: Guow and the D.A. are developing an interactive online ag resource visualization tool that combines an exhaustive analysis and feedback flow of records and automatically feeds them to informative images.",
    section: "us",
    author_id: author_4.id,
    photo_id: photo_2.id,
    featured: false,
    highlighted: false,
    created_at: "2021-02-15 18:38:20 UTC",
    updated_at: "2021-03-22 04:30:55 UTC",
  )

  article_4 = Article.create!(
    title: "Senate Democrats Push to End Filibuster",
    body: "The White House and Senate have a number of different ideas. Republicans have a variety and sometimes no clear idea, but they're not interested in moving an agenda.\r\n\r\nThe GOP's path to power is set for a sharp end to an era of cuts and privatization, a trend to reduce even more than 5 percent of spending. In the past four years, they have been holding their way toward privatizing things for which they traditionally have provided most of the public sector. Their goal has always been to raise more revenue.\r\n\r\nTheir aim is to restore the public sector and prevent a government takeover \u2014 a move that will require new legislation and changes in the budget, which is the same at a moment when it is threatening the authority of Congress and threatening to bring to the floor additional deficits, which are of no benefit to the people. But in Congress, they would also need an urgent and expensive, public sector overhaul. As the Obama administration has indicated, they will do more to cut spending than they otherwise might. But they also will need to return such legislation as ObamaCare, while still maintaining full control of the programs in the House: The legislation from nonpartisan Rep. Thomas Massie \u2014 who has been a target of attacks from Republicans on Capitol Hill.\r\n\r\nThe Democratic majority in the House still needs to pass legislation to fund the government, or the tax system. They also need to produce the entire budget for a new president. Democrats are still demanding that they change the entitlement system that the president is promising, and they want a way to tax a huge portion of the new spending. This new form of taxation is likely to take even farther than the Medicare cuts now the debt is going to bring if the country's debt is really going to grow \u2014 and it is very likely to continue.\r\n\r\nThere is also a way of trying to restore credibility. Republicans aren't very good at restoring credibility by themselves. Yes, they will bring down the economy. But those will come after spending, not spending, and they will also need to make clear that spending, like Medicare, is expensive by the way, and instead a whole bunch of cutbacks in the defense, overseas, and as the economy shifts to a new direction.\r\n\r\nIt is hard to think of an argument that isn't putting forward that isn't worth looking at. But it is a point in time where every argument has someone in it. At the moment, Democrats are not doing a good job keeping this country in a do-nothing world.",
    section: "politics",
    author_id: author_2.id,
    photo_id: photo_6.id,
    featured: false,
    highlighted: true,
    created_at: "2021-02-15 19:21:10 UTC",
    updated_at: "2021-03-22 05:05:15 UTC",
  )

  article_5 = Article.create!(
    title: "Senate Push Larger Federal Budget as Inflation Fears Grow",
    body: "The White House warns that it will take at least another year to clear the debt ceiling and avert a large, temporary, \"massive, 20 percent\" cut in revenues next year. The budget deal adds $39 billion a year to the national debt, but requires unanimous votes from the House and Senate. Democrats say the spending proposal is too modest for their own budget priorities. To be clear, the spending deal includes items which would be needed to reduce federal debt, including debt payments for social services, social welfare, and debt payments to the poor and disabled as well as balance-sheet programs for retired or elderly Americans. It is the clearest statement yet that the government could borrow over the long term, even if borrowing from the federal government for the purpose of supporting economic growth would be unpopular. The deal, however, is intended to be bipartisan, not just popular. On fiscal year ends: 2019, fiscal year ends 30 March 2019, and total debt by $17 trillion. To date, the budget balance of the government is $390 billion above the economic expansion estimated for that year. While the White House contends that a 10- or 20-year agreement would get its desired effect, it never materializes in budget form, even though the agreement includes provisions for spending that is needed to balance the federal budget. Most of the debt has been accrued. At the same time, a large portion of it has been borrowed, largely due to interest payments and payments to the debt ceiling. A significant portion of it is owed to the debt ceiling, and is on the condition that the debt ceiling is repaid, either by borrowing from the federal government during the year 2019, as the debt ceiling has been set, or by borrowing from the Treasury during 2019, as the debt ceiling has been set at $1.01 trillion.\r\n\r\nThe term \"deficit\" refers not to actual GDP, but to an economic expansion the federal government intends to reduce by another $607 billion over the next 15 years. CBO projections would add to that a total of $607 billion. The budget deal, therefore, would be a substantial step towards paying down debt and slashing spending by $200 billion from programs that pay our teachers, pay for the elderly, and borrow money to pay down debt.\r\n\r\nBut it also includes provisions for spending for deficits that would reduce debt by $200 billion but remain below the $1.1 trillion provided projected for that purpose by Congress, as well as provisions designed to offset the deficit that would be realized by the government. Spending on programs that support the deficit decreases by $4 trillion a year from 2013 to 2020 and is projected to $4.4 trillion in 2019 if the tax cuts and tax increases are fully extended.\r\n\r\nThe deficit reduction the president proposed for either of his three major budget proposals in January, 2017, will be $18.3 trillion in 2019, according to CBO. Assuming the president was only addressing the $1.2 trillion projected deficit reduction he outlined in February, however, CBO projected, based on the CBO's forecasts, to be about $1 trillion below the $800 billion projected. That's $880 billion under-asseded \u2014 $6.3 trillion under-assist \u2014 and $880 billion under-assist. The $800 billion in additional spending in tax increases that the new budget proposals would raise is, in fact, about as drastic as the $800 billion in additional spending that the president proposed for the new budget proposal.\r\n\r\nUnder current law a total of $12.4 trillion in additional spending was authorized under existing law, except for $11.3 trillion over 10 years. (This means the deficit of $607.4 trillion is the equivalent of about 10 percent GDP of GDP.) Since the budget process whereby the government uses its tax dollars to pay down debt by $1 trillion to the deficit, then the deficit of the new budget program is $12.4 trillion \u2014 as under current law, then, as over half the $800 billion projected for spending by this new budget. Under current law, we have been paying more dollars into Medicare because the program has been cut by $2.4 trillion due to the reduction in Medicare benefits under the Affordable Care Act.\r\n\r\nWe are also at $12.4 trillion in debt that under-designed unemployment insurance that is available to a large group of unemployed adults and that includes a lot of government workers for a lot of other reasons, such as reduced working hours. This would lead to unemployment benefits for the chronically disabled, the elderly, and the disabled, also known as food stamps. Since the budget was originally crafted to address the $800 billion, the projected cost could grow over time to roughly 6.6 million people, about twice the average household income of the current population. The size of the debt is not limited to the current size of the economy. Instead, the government is paying out $1 trillion in interest for next year \u2014 approximately about a third of the $800",
    section: "business",
    author_id: author_3.id,
    photo_id: photo_5.id,
    featured: false,
    highlighted: true,
    created_at: "2021-02-17 01:53:50 UTC",
    updated_at: "2021-03-22 04:47:55 UTC",
  )

  article_6 = Article.create!(
    title: "Suspected Russian hack fuels Additional US Action on Cybersecurity",
    body: "The White House and U.S. intelligence agencies did something that could lead them to believe that Moscow was hacked after they were shown information from a hacked team.\r\n\r\nAccording to Fox News' Andrew Scurrilow, who reports on a Washington Post story, Russian officials claimed to have had backdoor access to a \"Russian-made website for the DNC,\" including the Biden transition team. That wasn't true and no one at the White House had ever known any of this.\r\n\r\nThen, at last week's presidential candidates' rally in Cincinnati, Ohio, Biden said as many Americans as possible wanted this \"tapping hack\" \"to be harmful to the political process\" and \"to try to put Russia back in.\" A White House spokesperson said Biden was \"absolutely committed to changing it\" and never believed the Russians were behind the cyberattacks.\r\n\r\nAs an analyst, I can say this is the only explanation given for the suggestion that Moscow actually thought this was an open espionage operation. But the evidence from the intelligence community was so damning \u2014 that it could be verified over time because it came from a senior U.S. official \u2014 that the Russians had been trying to \"track down\" the hacker.\r\n\r\nIndeed, this is yet another clear example of what U.S. intelligence officials have called the \"possible Russian operation\" that was so sophisticated the Obama administration and intelligence agencies were \"rigged\" to deny it. But the evidence is in for yet another test.\r\n\r\nAs The New York Times's Mark F. Tait has pointed out, this is a major breach of an intelligence asset in Turkey, where the U.S. has spent billions on cybersecurity and intelligence services for almost a decade. While it's widely accepted that the U.S. is a U.S. country, it's very possible that the Russian state was behind it. And, if the CIA were not already trying to track down the hacking, it could have been done by a top American president, especially one that, like Barack Obama, will have such an advantage in political life.\r\n\r\nMeanwhile, in the United Kingdom, the United States' security policy has changed radically over the past decade. Britain's Foreign Office insisted that all British citizens should be required to carry firearms if they are to leave the country. But the U.K.'s National Security Agency has said the government and the Parliament are now willing to grant this to all British citizens.\r\n\r\nAll political parties in the United Kingdom should now release all passports for British citizens, including Canadian citizens, but the government should do something about this: let Canadians not have to enter a state of permanent panic. We're giving Britons the freedom to commit treason.\r\n\r\nDavid Cameron has a similar story.\r\n\r\nIt is well known that the U.S. military, once viewed as the bulwark of world politics, is increasingly worried about how its allies, especially in Europe, are responding to the hacking of an American presidential election. If Britain is willing to be the next target, the U.S. should be asking for help trying to protect a friend for whom they won't be subject to such a dark plot \u2014 an example of the sort of danger that would make many people nervous.\r\n\r\nThis is a big problem \u2014 and one that President-elect Biden could potentially exploit this as well. He, the next president, and the next administration can help make this a reality.",
    section: "us",
    author_id: author_4.id,
    photo_id: photo_1.id,
    featured: false,
    highlighted: false,
    created_at: "2021-02-19 22:09:26 UTC",
    updated_at: "2021-02-19 22:09:26 UTC",
  )

  article_7 = Article.create!(
    title: "Stocks End Day with Mixed Results",
    body: "The top two-thirds of a country's income per capita is lower, but only at 2.8, with the median household member earning more than $50,000 a year. In contrast, wages for fast-food workers continue to keep increasing.\r\n\r\nFor all the talk about growth, the real world is showing no sign of slowing down. The lost jobs account for almost a third of all employment growth this year. Economists have been delving into what data we already know: growth, more than a stagnant wage floor and inequality.\r\n\r\nMany of the central banks around the globe have maintained the belief that inequality is a crime against the good, good or the bad. Their heads are now neatly hidden and this is even less true in the United States, where economic inequality has been declining for decades.\r\n\r\nA growing sense of national unrest offers some hope that a return to such vitality can yield a brighter, more peaceful world for everyone, a brighter future for everyone.\r\n\r\nAdjusted for inflation, the annualized hourly earnings of US householders have increased faster than inflation \u2014 by as much as 51 percent \u2014 from 1.8 years in the 1970s to 1.9 years in the same period. The only exception is in labor markets, which have seen the wage growth of the high-paid, those behind. (For a more detailed breakdown of inflation, see here and here.)\r\n\r\nThe US dollar \u2014 a measure of a dollar's worth\r\n\r\nInflation, in its most recent period, has been trending downward for more than a century. What's called the \"double-digit inflation\" in present-day economies is a real shock (even if it's the kind of shock experienced by households who cannot adjust to a new monetary rise). In the past, such shock tended to be temporary; now, it's simply a severe shock in the form of \"cronyism\"; once you get past it, the whole thing is a matter of seconds to be treated like some pointless exercise for a little longer than most people can muster up. There's no reason that this is any different from \"cronyism\" \u2014 an economic policy that isn't likely to create a new world in a decade.\r\n\r\nThe \"real\" world is too slow and distant to enjoy the same kinds of time-shops and services. In this, there's no limit, and a double-digit inflationary lesson is the best way to bring them to a halt. By contrast, in the present, the country's economic situation is more uncertain than ever. It may be better to wait and see.",
    section: "business",
    author_id: author_3.id,
    photo_id: photo_3.id,
    featured: false,
    highlighted: false,
    created_at: "2021-02-19 22:13:43 UTC",
    updated_at: "2021-03-22 04:37:42 UTC",
  )

  article_8 = Article.create!(
    title: "When Will Students Return to School?",
    body: "Local school boards will decide whether or not students will return to the classroom, as vaccination rates increases. The school board is also seeking a notice of liability and a hearing before the federal government for parents and school administrators who would like to see the federal government establish a health plan to cover vaccinations. The school district already has a notification on its website about liability.\r\n\r\nThe school district plans to sue the federal government. The states that have more than four million students do not provide any clear medical information. They can still be affected. The school district also needs to let parents and school members know what information is being provided.\r\n\r\nThe Children's Health ministry worked with The Washington Post to obtain a copy of the memo, first reported by The Washington Post, and the company is willing to publish a copy if it is approved for publication in the United States.\r\n\r\nAsked about the memo, the minister of health said it should not be available in Canada.\r\n\r\nHe also extended a request for another article about measles in Toronto, the Times' reporter said, a reference of the disease that had paralyzed a child in North York, Ont. that was later confirmed as measles.\r\n\r\nNeither the ministry or the city administration would comment for this publication.\r\n\r\nA final report is expected by the end of the week, according to the health ministry.\r\n\r\nThe ministry is also negotiating with Ottawa for additional money to hire professional doctors from outside the country.\r\n\r\nNo one was informed of the talks of giving up on the measles vaccination mandate, the newspaper reported. But the government said it would not be granting the $7.8-billion annual subsidy, the Times reported. The Canadian charitable arm has not commented on the matter.\r\n\r\nOn Thursday, without the UCP election, the Conservative-controlled Ontario legislature in Toronto would fall again in line.\r\n\r\nAn election will take place on Oct. 28 in Toronto Centre.",
    section: "us",
    author_id: author_4.id,
    photo_id: photo_15.id,
    featured: false,
    highlighted: true,
    created_at: "2021-02-21 01:44:32 UTC",
    updated_at: "2021-03-23 00:56:33 UTC",
  )

  article_9 = Article.create!(
    title: "No Charges Will Filed in Officer Involved Shooting",
    body: "Officers are searching for a suspect who was carrying what appeared to be a gun during an \"arm-in-arm\" confrontation with two black men in southeast Baltimore.\r\n\r\nThe man who was shot was taken to a local hospital with non-life-threatening injuries, police said. The second man was in custody and is still at large.\r\n\r\nThe fight began on Monday when officers spotted one of the men reaching for a gun.\r\n\r\nOne of the officers shot the man, police said. The other officer then shot at the other, striking the man once in the abdomen, they said.\r\n\r\nThe man who was shot told authorities that a black male approached him with a handgun, but he was not involved in any other confrontation, police said.\r\n\r\n\"We've got a problem with people walking around with guns,\" police Sgt. Paul Davis said.\r\n\r\nAfter the shooting, the man told officers that the two black men were trying to run him off. Officers did not identify the man, police said. The officers were out for their own safety Monday.",
    section: "us",
    author_id: author_4.id,
    photo_id: photo_11.id,
    featured: false,
    highlighted: false,
    created_at: "2021-02-24 00:11:17 UTC",
    updated_at: "2021-03-22 05:21:53 UTC",
  )

  article_10 = Article.create!(
    title: "OMB Nominee Faces Tough Senate Confirmation",
    body: "That may not be a problem this time around. GOP Senator Lisa Murkowski said, \"She is very qualified and I have no hesitation in saying I will support her.\"\r\n\r\n\"If you want a proven leader to head the office of management and budget, Senator Murkowski is your choice,\" Republican Senator Rob Portman said in a statement. \"She's done a tremendous job serving my state and I look forward to her being the next director of the agency.\"\r\n\r\nOther Republican Senators called Murkowski, a Alaska native, a \"good choice.\"\r\n\r\n\"She's served in the Senate and in the House, her work has been recognized, and I think she'll be an effective leader,\" said Republican Senator Susan Collins.\r\n\r\nIn another key vote that will determine the success of the new administration, Murkowski cast a \"no\" vote on the confirmation of John Kelly as White House chief of staff.\r\n\r\nShe said Kelly's background makes him a danger to national security and called him a \"former Marine who had to take care of wounded warriors.\"\r\n\r\nMurkowski said, \"I have concerns about his ability to manage a military department when our country and its allies are struggling with threats to our security.\"\r\n\r\nShe called the confirmation of Kelly a \"risky move.\"\r\n\r\nIn addition to the two top jobs of White House chief of staff and Treasury secretary, Kelly also is expected to oversee all U.S. immigration policy, the FBI and the Secret Service.",
    section: "politics",
    author_id: author_2.id,
    photo_id: photo_5.id,
    featured: false,
    highlighted: false,
    created_at: "2021-02-24 03:58:54 UTC",
    updated_at: "2021-03-22 04:48:56 UTC",
  )

  article_11 = Article.create!(
    title: "Roethlisberger to Make Return in 2021 Season",
    body: "Losing his fifth quarterback in the NFL this season, Roethlisberger is coming off his second consecutive Pro Bowl campaign, his second time in the top five since being traded to Pittsburgh at the start of the 2007 season. He has thrown for 18,003 yards, a mark that will stand until the end of the 2018 season.\r\n\r\nIn his second stint with the Steelers, he has had 14 games in which he has thrown for more than 1,000 yards, leading the league in that category in 2016. He was only the fifth player to lead the league in that category since the merger.\r\n\r\nBut the latest Pro Bowl effort may be his last. Roethlisberger is under contract for only one more season, and the Steelers expect to get more value for that investment.\r\n\r\nThe Steelers could turn to former USC quarterback Cody Kessler in his second season with the team.\r\n\r\nIt's hard to remember now, but the Pittsburgh Steelers were only 3-9 last year. The team started off that season as their biggest threat to win the Super Bowl. But it didn't last.\r\n\r\nIn Week 10 against the Baltimore Ravens, a loss that ended the season after two seasons in which the Steelers won every game. The loss to the Baltimore Ravens came on a Monday night, after two days off for the players.\r\n\r\nTwo weeks later against the Jacksonville Jaguars, a loss that ended the season after three seasons in which the Steelers won every game. The loss to the Jacksonville Jaguars came on a Monday night, after two days off for the players.\r\n\r\nThe last game of the 2016 season came on Thanksgiving, in week 15. The Steelers got off to a great start, with a big fourth quarter to win 24-19. But a week later against the Cleveland Browns, a loss that ended the season after four seasons in which the Steelers won every game.",
    section: "sports",
    author_id: author_1.id,
    photo_id: photo_14.id,
    featured: false,
    highlighted: false,
    created_at: "2021-02-24 20:10:25 UTC",
    updated_at: "2021-03-23 00:51:24 UTC",
  )

  article_12 = Article.create!(
    title: "Rumors of Russell Wilson Trade Denied",
    body: "\"Russell has not demanded a trade. He's not really talking to teams. He hasn't done that, so he's not trying to be traded,\" Rodgers said.\r\n\r\n\"Russell wants to win and he loves his team, so I think at this point he's not going to be traded. And I think he understands that.\"\r\n\r\nThe Seahawks signed Wilson for $20 million over three years as a trade chip in the summer of 2012, in a deal that sent then-Rams quarterback Sam Bradford to the Vikings.\r\n\r\nWilson was injured all season in 2013 and his play suffered, but he was the backup in 2014.\r\n\r\nSo why now? Why should the Seahawks think Wilson is interested in leaving?\r\n\r\n\"I think Russell has felt in the last five or six years that if he was on a winning team he would've been traded,\" Rodgers said. \"So he does not feel comfortable where he is. So you're always looking for the best possible situation.\"\r\n\r\nThe Seahawks have said all along they are confident in Wilson. They signed him for $20 million over three years, and he threw 18 touchdowns and two interceptions in limited action in 2015.\r\n\r\nThe Seahawks have the No. 1 overall pick in the draft on April 27 and Rodgers said the team will draft a quarterback. The team has the second-best record in the NFL at 5-1 and have won four games over the past two weeks, including the Super Bowl. Wilson's health is not a determining factor in how they view him as a player.\r\n\r\n\"His health is not really going to be a factor in how we view him as a player,\" Rodgers said. \"If you're healthy enough to get to this point, that's the ultimate sign of being a good quarterback. That's how he's viewed as a player.\" He's also healthy enough to stay healthy, Rodgers said, adding he believes the Seahawks have done the right things with the quarterback.\r\n\r\n\"I don't know that I would trade him at this point,\" he said.\r\n\r\nThe Packers' new coach said it wasn't an immediate situation when Wilson met with the team in January, although he didn't expect it to be one of his main focuses this offseason.",
    section: "sports",
    author_id: author_1.id,
    photo_id: photo_14.id,
    featured: false,
    highlighted: true,
    created_at: "2021-02-25 20:45:52 UTC",
    updated_at: "2021-03-23 00:51:12 UTC",
  )

  article_13 = Article.create!(
    title: "Tiger Woods in Hospital After Car Accident",
    body: "The crash was \"pretty awful, this is horrible,\" U.S. Attorney for the Central District of New York Loretta E. Lynch said.\r\n\r\nTaft boss Brian Telegdy, pictured at left a crash scene, has said he was not aware of the media report that helped kick Cabal out of the scene.\r\n\r\nThe crash was on the street where many people were racing into the lane and not on the highway under the driver's breath, Loretta E. Lynch said, adding that officials should be able to use a camera to capture what happened as it happened in the crash. (Eric Fienstrut/CAA)\r\n\r\n\"Maybe it's a mistake to put that camera in this situation,\" E. Lynch said Sunday when speaking with media at U.S. Attorney's headquarters in New York in April.\r\n\r\nAs police from several departments have pulled over cars, one has even been linked to the crash, which killed four people as part of the Cushwa deal, she said.\r\n\r\n\"It really was an accident.\"\r\n\r\nShe said it was a combination of the victims' insurance, which was insurance to avoid a major accident in a long-term car insurance plan, and the fact that the insurance company, Insurance.com Financial Corp, was trying to manage the crash in the first place. They also included people who are no longer covered under the Cushwa deal, she said.\r\n\r\nShe said that in the Cushwa deal, in a few places and a few days, the cars are likely to get hit again.\r\n\r\n\"Maybe even more than in the accident, the car is going to crash if you're in a car,\" Loretta E. Lynch said. \"So if it's a crash, it's a coincidence.\"\r\n\r\nLynch said that the crash was the first to ever happen with the Cushwa deal since it was signed in 2010, in the midst of \"a whole lot of drama.\"\r\n\r\nLynch said she was pleased that the crash was averted and praised the work of a law enforcement official who worked in the Cushwa deal case as well as the investigation into the accident.\r\n\r\nLynch said that the accident \"is a big shock to the justice system\" but also that the investigation has taken a \"very long time.\"\r\n\r\nShe added that U.S. and international law enforcement agencies are currently working together to determine whether there are any new or developing alternatives to the Cushwa deal, noting that the federal government has not yet taken up any of their offers.\r\n\r\n\"The U.S. government doesn't have the resources to look at this,\" she said. \"There are several alternatives. And our job is to have federal, state, and local authorities answer all charges.\"",
    section: "sports",
    author_id: author_1.id,
    photo_id: photo_14.id,
    featured: false,
    highlighted: false,
    created_at: "2021-02-26 05:49:59 UTC",
    updated_at: "2021-03-23 00:51:01 UTC",
  )

  article_14 = Article.create!(
    title: "Costco to Raise Wage to $16",
    body: "Costco will raise its minimum wage to $16 per hour. But it has yet to announce what it will do with its current minimum wage, which is $11.50 per hour, which is higher than the national minimum wage of $7.25.\r\n\r\n\"While we are always evaluating our business with respect to wages, we have been moving in a positive direction,\" said the company. \"We believe it is important that all employees \u2014 including those at Costco Wholesale \u2014 are able to earn a minimum wage.\"\r\n\r\nThe minimum wage will go up by the time Costco stores are open in Washington, Colorado, Nevada, Illinois, Missouri, Maryland, New Jersey, Oregon, Vermont and Hawaii. However, many others will not get the raise, including smaller, independent and franchise stores.\r\n\r\nCostco spokeswoman Marcy Schneider told NBC News that workers will not get the raise, including ones who work part-time and receive overtime pay. In that case, she said, \"It will be a lower hourly rate.\"\r\n\r\nIn addition to the minimum wage increase, the company has announced a new training program. Schneider said that now workers will be trained to do a variety of job tasks, including check out, take inventory, stock shelves, check out and inventory, and so on.\r\n\r\nCostco has also decided to be more proactive about hiring qualified candidates. A number of other companies have dropped out of the workforce entirely due to low wage and overtime requirements.\r\n\r\nTo be clear, this is not Costco's first experience with a minimum wage increase. In 2012, the company also increased the minimum wage for its warehouse workers from $13.50 per hour to $15 per hour, then to $12.50 per hour in 2013, and to $13.50 per hour in 2014. At the time, Costco told the AP it has been paying its workers for a decade at the rate, and that the new increases would only impact new hires. But many workers, including some who were already paid for overtime, did not see their pay go up at all.\r\n\r\nCostco workers in other cities have been fighting for higher minimum wages, as well. \r\n    \r\n    ",
    section: "us",
    author_id: author_4.id,
    photo_id: photo_4.id,
    featured: true,
    highlighted: false,
    created_at: "2021-02-26 05:55:06 UTC",
    updated_at: "2021-03-22 05:05:42 UTC",
  )

  article_15 = Article.create!(
    title: "US implicates Saudi crown prince in journalist’s killing",
    body: "A high-profile murder in Saudi Arabia has been implicated in the killing of a former Saudi diplomatic attach\u00E9, according to a report from London-based Arabic language newspaper Al Hayat.\r\n\r\nMujtahid Abdullatif, who was working for the Saudi mission to the United Nations in New York, was shot three times near the Grand Hyatt Hotel, in Manhattan. According to Al Hayat, Abdullatif was on a regular \"walkabout\" with his son at the time of his death.\r\n\r\n\r\n\"We consider that Abdullatif's killing may be part of an inside job. The murder is part of a plot against the Saudi security force,\" a source in the country told Al Hayat, the Arabic language paper.\r\n\r\n\r\nAnother Saudi source said that a plot in which the killers \"have killed a Saudi diplomat for personal gains.\" The source added that a suspect is \"an important member of the intelligence services.\"\r\n\r\n\r\nSaudi Arabia's state-run Saudi Press Agency (SPA) has repeatedly blamed Abdullatif's assassination on \"extremists.\"\r\n    \r\n    \r\n    \r\n    ",
    section: "us",
    author_id: author_3.id,
    photo_id: photo_12.id,
    featured: false,
    highlighted: false,
    created_at: "2021-02-26 20:48:36 UTC",
    updated_at: "2021-03-22 05:27:04 UTC",
  )

  article_16 = Article.create!(
    title: "President Bident to Visit Texas to Survey Damage",
    body: "President Joe Biden on Tuesday will travel to Texas to survey damage from the winter storm that closed schools and shut down the nation's busiest highways and airports, and to meet with local and federal leaders.\r\n\r\nThe storm, which dumped record amounts of snow in parts of Washington, Pennsylvania and New Jersey, dumped more snow in New Jersey -- 8.8 inches in some places, the National Weather Service reported -- than a regular snowfall in New York City during the same time period in 2010, the largest snowfall on record in the state.\r\n\r\nThe storm damaged more than 100 homes and caused damage to more than 2,000 others, officials said. The storm brought near record-breaking winds as it came ashore in North Carolina, South Carolina and Georgia, the National Weather Service reported.\r\n\r\nBiden will leave Washington, D.C. Tuesday afternoon, arriving in Dallas at 11 p.m. ET, White House spokesman Jen Psaki said. He will meet with National Guard leaders, which is standard protocol when military personnel are called to work, Earnest said. He will then travel by helicopter to a military camp in Fort Worth, Texas.\r\n\r\nThe president has traveled frequently to Texas in the past year to survey the damage and monitor recovery efforts, as he prepares to leave the White House at the end of the year. He is scheduled to arrive Wednesday afternoon in Fort Worth.\r\n\r\nOn Capitol Hill, lawmakers will return to Washington at 9 a.m. and are planning to meet with the president early Wednesday morning. On Wednesday afternoon, they will travel to the Capitol and be on the House floor at 2 p.m.\r\n\r\nThe Senate plans to resume its work at 5 p.m. ET, with a vote expected around 7 p.m. in the chamber. The House is slated to convene at 11 a.m., with votes expected around 12 p.m.",
    section: "politics",
    author_id: author_2.id,
    photo_id: photo_1.id,
    featured: true,
    highlighted: false,
    created_at: "2021-02-26 22:04:38 UTC",
    updated_at: "2021-02-26 22:04:38 UTC",
  )

  article_17 = Article.create!(
    title: "Massachusetts Man Scammed 3 Women Out of $500,000",
    body: "A man claiming to be a representative for Google and Apple told three women they had won the lottery and owed them $500,000. But when they asked him for their money, he pretended to be a big company and demanded they hand over the money before they could call the police.\r\n\r\nThe three victims are from Newburyport and had been to meet with the man at the same hotel where he had provided them with a Google ticket at the airport and asked for their money back. However, the man was a fake, according to police. They contacted local law enforcement, who said they would track him down and deal with him, according to police. But the scammer was able to avoid law enforcement and the victims were never contacted again.\r\n\r\nOne woman was the winner of the lottery and was going to pay the debt off, however, she thought she won the lottery and didn't know the scammer was a fraudster. She later discovered the scammer had also stolen her credit card information and used the information to purchase a house that was actually owned by her mother, who had also been victimized.\r\n\r\nA woman who has been the victim of a scam told us, \"If they don't call you right away you never find out, and it could cost you $500,000. In my case it would have cost me close to $1.2 million. That's over six million dollars.\"\r\n\r\nWe had previously reported that one person in Washington had won $30 million in a lottery scam, and it was revealed that this number was a lottery winner's lottery ticket, not his, according to the Washington State Lottery. There is no indication that the other three victims are lottery winners, and the scammer did not have access to their credit card numbers.\r\n\r\nThe Washington State Lottery states, \"The Washington State Lottery does not take any action on the winning numbers if someone wins a prize in a state-run lottery unless the people who were the victims or winners of the prizes are contacted by the lottery to request information to verify their identities. This is done to ensure that the state-run lottery is properly and correctly reporting their winners to the state lottery.\"",
    section: "us",
    author_id: author_4.id,
    photo_id: photo_10.id,
    featured: true,
    highlighted: false,
    created_at: "2021-02-26 22:11:31 UTC",
    updated_at: "2021-03-22 05:17:39 UTC",
  )

  article_18 = Article.create!(
    title: "Texans Release Duke Johnson",
    body: "The Texans cut Johnson a few days ago so it's not a surprise. His release came on the same day the Texans waived RB Andre Brown. Johnson, 25, was in the final year of his rookie contract.\r\n\r\nThe Texans are back in the market for running backs and Johnson could be a target. Johnson, who played for the Broncos in 2014 and 2015, is a five-time Pro Bowler. He's also known as a bruising back. The veteran may help a team struggling to find the right combination on offense.\r\n\r\nThe Texans released running back Duke Johnson. The Texans cut Johnson a few days ago so it's not a surprise. His release came on the same day the Texans waived RB Andre Brown. Johnson, 25, was in the final year of his rookie contract.The Texans are back in the market for running backs and Johnson could be a target. Johnson, who played for the Broncos in 2014 and 2015, is a five-time Pro Bowler. He's also known as a bruising back. The veteran may help a team struggling to find the right combination on offense.",
    section: "sports",
    author_id: author_1.id,
    photo_id: photo_7.id,
    featured: false,
    highlighted: true,
    created_at: "2021-02-26 23:49:58 UTC",
    updated_at: "2021-03-22 05:08:32 UTC",
  )

  article_19 = Article.create!(
    title: "Sage Northcutt to Fight Shinya Aoki",
    body: "It was originally scheduled for 8:00 PM ET/5:00 PM PT, but the event has been moved back to 9:30 PM ET/6:30 PM PT to prevent the possibility of confusion. With the shift, it will not be included in The Ultimate Fighter 22: \"Saffiedine vs. Namajunas\" live stream, which will be announced at a later date. \r\n\r\nAs previously mentioned, in the end, it was up to Nogueira if he wanted to continue on as a light heavyweight contender or go back to welterweight. If he returns to welterweight, then Nogueira will be facing the winner of a fight between Namajuna Sperry Jr. and Tarec Saffiedine on Jan. 26. \r\n\r\nWith the move to light heavyweight, this means Nogueira will be fighting for the interim belt, and Saffiedine will be fighting for the championship. Nogueira (20-2-1) has dropped two of his last three bouts, but is undefeated in his last nine. The Brazilian has not suffered a knockout loss since 2008, and has taken seven fights to get to the finish. \r\n\r\nHe made his UFC debut in December 2011, taking a decision from Josh Koscheck and finishing his final five opponents. On his first UFC card, Nogueira was submitted by Thiago Alves, but went on to submit Joe Lauzon, and win a decision over Josh Burkman. However, the Brazilian lost the title to Roy Nelson on the same card. On his second UFC card, he defeated Mike Richman in the co-main event, and ended his five-fight streak by finishing fellow welterweight Nate Marquardt.",
    section: "sports",
    author_id: author_1.id,
    photo_id: photo_9.id,
    featured: false,
    highlighted: false,
    created_at: "2021-02-27 00:00:04 UTC",
    updated_at: "2021-03-22 05:14:43 UTC",
  )

  article_20 = Article.create!(
    title: "Weekly Jobless Claims Decrease, But Market Remains Challenged",
    body: "Despite all of this, the National Retail Federation, a union representing auto workers, continued to oppose the Biden Administration's rollback of the Dream Act. \"I think it really reinforces \u2014 to me \u2014 what is being suggested in an opinion piece, and where it is going in the Democratic Party,\" Tom Goad, a veteran NLRB commissioner who now has a law firm in Seattle, told the Huffington Post.\r\n\r\nGoad says the Dream Act simply did not apply to illegal immigrants who do not meet several criteria, as defined by the Immigration and Nationality Act: they're not in the nation illegally and are on a pathway to naturalization on the basis of their national origin, where they are not an illegal immigrant or otherwise discriminated against because of their ethnicity or religion. \"I think that's a big problem for the American people today, because it shows up in this piece and we see in [that case] in certain statehouses that their citizens are really undocumented, and in some cases illegal,\" Goad said. \"This idea that illegals are somehow not here is not going to work. I think the problem of illegals is even greater because at least when those who are already here come to see lawyers and they become part of our families, it makes it harder for them to find jobs. And there are a lot of people in the country who are living and working illegally and their lives are being put out of order, and we just don't agree with it, so we can't get them out of here, and they're losing families. So, the Dream Act doesn't apply to these people.\"\r\n\r\nBiden and Senate Republicans aren't the only ones who are resisting Biden's agenda. On June 14, labor groups, like AFSCME Local 1345, filed a lawsuit challenging President Bill Clinton's plan to overhaul education and welfare for illegal immigrants and to require low-income, non-AARP workers to work as \"flexible workers.\"\r\n\r\nThe American Federation for Children and Families filed a lawsuit yesterday demanding that the Obama Administration block the implementation of the Dream Act, which many members of Congress oppose. The group has pushed for a halt to the work requirements for illegal immigrant labor and a major overhaul of the Work Permit Program, which allows federal contractors to negotiate contracts for those on temporary contracts from an illegal immigrant in the US.\r\n\r\n\"We are opposed to a Biden plan that is going to fundamentally change things, and our national security and safety would be severely weakened because he would not be able to make this deal with foreign business interests and foreign actors,\" Laura Zinn, a staff attorney for the American Alliance for Immigration Reform, tells the Huffington Post. \"The Dream Act is an important piece of legislation in the framework of the Immigration Promotion and Protection Act we passed. It's going to allow some kind of amnesty, but there is a legal right to work, and we believe it is critical for our economy and our democracy as a whole.\"\r\n\r\nGoad says that despite Biden's desire for an enforcement program known as the Dream Act to stop the illegal immigrants and their children coming to America, Congress should only delay enforcement for the \"lazy few \u2026 who can't afford to pay what it take to continue their work,\" as former immigration reform advocate David Weigel puts it.",
    section: "business",
    author_id: author_3.id,
    photo_id: photo_4.id,
    featured: false,
    highlighted: true,
    created_at: "2021-03-02 02:16:30 UTC",
    updated_at: "2021-03-22 04:42:30 UTC",
  )

  article_21 = Article.create!(
    title: "Oil Price Falls With OPEC Meeting",
    body: "In a week where the Saudi's came out and said that they would do whatever it took to save their market, oil prices plunged after OPEC decided not to cut production.\r\n\r\nThe price of oil fell this week from $107 per barrel to $96 per barrel. Many are claiming that this move is the beginning of the end for the fracking industry.\r\n\r\nThe biggest difference between the $100/barrel oil price and the $96/barrel price is that the $100 price was before the price of oil fell about $20 since February 3. There was no massive supply shock in the first half of 2021, so when the price dropped to $100 oil was likely due to a decline in demand. If the supply in the first half of 2021 had remained the same, then the price would have been at the $96 price. Once the oil price hit the $96 price there were more supply cuts that will lead to a price decline down to $95/barrel.\r\n\r\n\r\nThis is only true for one year though, as once the supplies in the first half of 2021 have been reduced, the price of oil will likely rise. It will have to do with the effect of the Saudi's decision to make OPEC do whatever it takes to save their market.\r\n\r\n\r\nThis is only true for one year though, as once the supplies in the first half of 2021 have been reduced, the price of oil will likely rise. It will have to do with the effect of the Saudi's decision to make OPEC do whatever it takes to save their market. It should be noted that the shale industry was already on the decline by this point and this fall in the oil price is likely due to lower production due to the Saudis oil price war. If the production had remained at the same level and the Saudis had increased their production, then the price would have increased.",
    section: "business",
    author_id: author_3.id,
    photo_id: photo_2.id,
    featured: false,
    highlighted: true,
    created_at: "2021-03-02 02:23:10 UTC",
    updated_at: "2021-03-22 04:30:16 UTC",
  )

  article_22 = Article.create!(
    title: "Senate Approves $1.9 Trillion Relief Package at Tail End of Pandemic",
    body: "Here are the key points from the original draft of the bill. This bill seeks to provide $5 billion for efforts to contain global pandemic outbreaks and stabilize the global system, among other priorities:\r\n\r\nIncrease access to critical sources of global pandemic control funding and assistance, including:\r\n\r\nProvide critical sources of non-targeted, nonlethal emergency funding, including:\r\n\r\nProvide funding for the international humanitarian relief task force, to coordinate the global response to a global pandemic.\r\n\r\nProvide for the implementation of necessary global climate change measures and action plans.\r\n\r\nProvide funding for major humanitarian security programs in the aftermath of the 2011-15 cold snap, such as the Red Cross and Doctors Without Borders.\r\n\r\nIncrease the availability of access to critical source of funding to provide immediate relief in affected regions from major human-caused disasters before, during, and after any outbreak.\r\n\r\nFund the use of the International Emergency Fund (IEP), with $8 million going to disaster-ravaged nations.\r\n\r\nProvide for the establishment of global response teams to coordinate and coordinate the action needed to respond safely to all emerging and developing threats to human health and well-being.\r\n\r\nFund the use of international money, as well as other necessary supplies, including food, fuel, and other necessities of life.",
    section: "politics",
    author_id: author_2.id,
    photo_id: photo_5.id,
    featured: false,
    highlighted: true,
    created_at: "2021-03-10 22:51:26 UTC",
    updated_at: "2021-03-22 04:48:40 UTC",
  )

  article_23 = Article.create!(
    title: "Gonzaga Bulldogs are Undefeated as They Enter NCAA Tournament",
    body: "Georgia State Bulldogs are 3-2 as They Visit Georgia. In the Quarterfinals, they won by a score of 19-3. In the Fourth Round, they had a 2:0 deficit with 3:12 to play. The Hawks won by as much as 34 points to win by 28. In the Semifinals, they won by as much as 40 points to win by 25.\r\n\r\nAlabama Crimson Tide beat Georgia State 38-6 in the Final Four of the 2017 CitiField Open. The Crimson Tide are 1-3 in the Final Four since 2012. The Tide play at Georgia State for the first time since 2012 (when they beat Kentucky), but have finished 1-14 since that point.\r\n\r\nAlabama is 2-9 in the Final Four so far in the tournament. The Tide made it from last month's last-place team, Alabama (1-6 in the Big 12 Tournament with a win). But, since getting knocked out in the NCAA Tournament, they still remain tied for sixth in the SEC.\r\n\r\nThe Alabama Crimson Tide's 2017 Schedule will be released on September 6.\r\n\r\nAlabama is 3-3 in the regular season, including a 9-0 record over their last three regular seasons. Their win over Florida Southern in 2016 resulted in the SEC Division titles on the line as they advanced to The 2016 Cotton Bowl.\r\n\r\nUCLA Golden Bears will join the Crimson",
    section: "sports",
    author_id: author_1.id,
    photo_id: photo_8.id,
    featured: false,
    highlighted: true,
    created_at: "2021-03-12 00:45:21 UTC",
    updated_at: "2021-03-22 05:11:58 UTC",
  )

  placeholder_photo = Photo.create!(
    alt_text: "none",
    title: "none",
    source_url: "/",
    photographer_name: "none",
    photographer_url: "/",
    license_type: "Public Domain",
    license_url: "https://creativecommons.org/publicdomain/zero/1.0/",
  )

  admin.favorite_articles = [
    article_3,
    article_4,
    article_7,
    article_8,
    article_12,
    article_17,
  ]

  placeholder_photo.image.attach(io: File.open("app/assets/images/no_image.png"), filename: "no_image.png")
  Photo.all.each do |photo|
    photo.image.attach(placeholder_photo.image.blob)
    photo.thumbnail.attach(placeholder_photo.image.blob)
  end
end
# rubocop:enable Metrics/BlockLength
