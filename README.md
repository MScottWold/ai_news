<img width="1050" alt="Masthead" src="https://user-images.githubusercontent.com/10493350/126410749-2ac6d03a-904c-45dc-95eb-7e122a3a29d1.png">

!! [**under construction**]
This site is currently offline and undergoing reconstruction

# The Banner Weekly
The Banner Weekly ([live site](https://www.bannerweekly.com)) is a an online publication where all the articles are generated using OpenAI's [GPT-2](https://en.wikipedia.org/wiki/GPT-2).

The Banner's purpose is as an educational tool and a place for readers to examine the role of artifial intelligence in online news and disinformation. It is a concrete example of how mass-produced, computer-generated content can be dressed up to mimic the look and feel of traditional publications. Hopefully, it will inspire a dialogue about the online information we consume and the influence of Presentation on perceived truth and credibility.

## About
The article's headlines are 100% real and taken from trusted publications around the web. Through the Banner's admin portal, the headlines are seeded to GPT-2 through an API call to [OpenAI's text-generator](https://deepai.org/machine-learning-model/text-generator). However, this may change depending on the availability/reliability of other models.

Since the model was trained on a dataset from the past, there are many outdated 'facts' generated by the AI. For example, incorrectly naming the President of the United States or current year. To maintain some level of believability, there is a [tool on the admin portal](https://github.com/MScottWold/ai_news/blob/master/app/javascript/packs/admin_portal.js) for swapping outdated names, years, etc. Otherwise, the text is all computer generated.

## User Features
Create a new account, or log in with 'Guest':'TheBanner2021!', to favorite/save articles

![Save Favorites](https://user-images.githubusercontent.com/10493350/126433733-4701ff3b-9f91-4e36-944e-cdb307d7a22f.gif)



Log in and discuss the articles

![Comment](https://user-images.githubusercontent.com/10493350/126433763-178c6ff6-4ed6-4341-b345-c508352a58cf.gif)



Visit all articles in the archives

![Archives](https://user-images.githubusercontent.com/10493350/126433814-d1fa69a2-2634-4a79-9c55-df712454fb90.gif)


## Technologies
* Rails 6.1
* React 17.0
* Redux 4.0
* React-router 5.2
* HTML/CSS/Ruby 3.0/Javascript ES6
* Amazon S3 (image hosting)

## Live Site
[The Banner Weekly](https://banner-weekly.herokuapp.com)
