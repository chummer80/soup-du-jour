# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Soup.delete_all
soups = Soup.create([
	{
		name: "Absolutely Ultimate Potato Soup",
		image_url: "http://images.media-allrecipes.com/userphotos/250x250/00/16/85/168555.jpg",
		description: "I have made this for many whom have given it the title. This takes a bit of effort but is well worth it. Please note: for those who do not wish to use bacon, substitute 1/4 cup melted butter for the bacon grease and continue with the recipe. (I generally serve this soup as a special treat as it is not recommended for people counting calories.)",
		recipe_url: "http://allrecipes.com/Recipe/Absolutely-Ultimate-Potato-Soup/Detail.aspx?evt19=1&referringHubId=16369"
	},
	{
		name: "French Onion Soup (Soupe à l'Oignon Gratinée)",
		image_url: "http://www.seriouseats.com/recipes/assets_c/2015/01/20150116-french-onion-soup-vicky-wasik-20-thumb-625xauto-418068.jpg",
		description: "For such a simple dish, French onion soup should be easy to make great. And yet so many versions taste like a cup of burnt-onion tea with melted cheese trying its best to cover up the flaws. This recipe develops great flavor with a long, slow caramelization of the onions, then punches it up with cider vinegar, fresh chives, and a surprise ingredient: fish sauce.",
		recipe_url: "http://www.seriouseats.com/recipes/2015/01/french-onion-soup-recipe.html"
	},
	{
		name: "Asparagus Soup",
		image_url: "http://foodnetwork.sndimg.com/content/dam/images/food/fullset/2009/4/14/1/EM1G74_25358_s4x3.jpg.rend.sni12col.landscape.jpeg",
		description: "This is a great basic recipe for asparagus soup. Its even better with different variations. Try adding fresh lump crapmeat or chopped prosciutto, its excellent! I know I will be making this soup for years to come!",
		recipe_url: "http://www.foodnetwork.com/recipes/emeril-lagasse/asparagus-soup-recipe.html"
	},
	{
		name: "Taco Soup",
		image_url: "http://foodnetwork.sndimg.com/content/dam/images/food/fullset/2011/11/23/0/FN_taco-soup-010_s4x3.jpg.rend.sni12col.landscape.jpeg",
		description: "Paula Deen - you did it AGAIN! I just won BEST SOUP out of 64 crockpots of soup at a work function! I won a gorgeous fall wreath and I couldn't have done it without your delicious taco soup recipe! It was mighty good and definitely the hit of the party! Thanks Paula :)",
		recipe_url: "http://www.foodnetwork.com/recipes/paula-deen/taco-soup-recipe.html"
	},
	{
		name: "Chicken Noodle Soup",
		image_url: "http://images.media-allrecipes.com/userphotos/250x250/00/03/69/36962.jpg",
		description: "This soup is delicious, and very easy to make. It is a wonderful soup to prepare for friends or neighbors that you would like to cook for.",
		recipe_url: "http://allrecipes.com/Recipe/Chicken-Noodle-Soup/Detail.aspx?evt19=1&referringHubId=16369"
	},
	{
		name: "Butternut Squash Soup II",
		image_url: "http://images.media-allrecipes.com/userphotos/250x250/00/96/43/964341.jpg",
		description: "This is a thick, rich soup with tons of flavor. Something I whipped up off the top of my head, with things I had on hand. Super easy, quick, and a great way to use squash. An instant hit at my house.",
		recipe_url: "http://allrecipes.com/Recipe/Butternut-Squash-Soup-II/Detail.aspx?evt19=1&referringHubId=16369"
	},
	{
		name: "Creamy Chanterelle Mushroom Soup",
		image_url: "http://www.seriouseats.com/images/2014/01/20140130-chanterelle-soup-27.jpg",
		description: "The final soup tastes like rich, velvety, liquid mushrooms, which is really precisely what it is, but I have no better way to describe it. It's satisfying, creamy, and delicious.",
		recipe_url: "http://www.seriouseats.com/recipes/2014/01/creamy-chanterelle-soup-recipe.html"
	},
	{
		name: "Split Pea Soup",
		image_url: "http://images.media-allrecipes.com/userphotos/250x250/00/04/66/46633.jpg",
		description: "This is a wonderful, hearty split pea soup. Great for a fall or blustery winter day.",
		recipe_url: "http://allrecipes.com/Recipe/Split-Pea-Soup/Detail.aspx?evt19=1&referringHubId=16369"
	},
	{
		name: "Turkey Wild Rice Soup",
		image_url: "http://images.media-allrecipes.com/userphotos/250x250/00/55/03/550306.jpg",
		description: "You can use long grain white rice for all or part of the wild rice, but reduce simmering time to 20 to 30 minutes.",
		recipe_url: "http://allrecipes.com/Recipe/Turkey-Wild-Rice-Soup/Detail.aspx?evt19=1&referringHubId=16369"
	},
	{
		name: "Cheesiest Potato Soup",
		image_url: "http://images.media-allrecipes.com/userphotos/250x250/00/33/93/339329.jpg",
		description: "Cream and sharp Cheddar are added to pureed potatoes and the soup is seasoned with dill and cayenne for a creamy, thick meal.",
		recipe_url: "http://allrecipes.com/Recipe/Cheesiest-Potato-Soup/Detail.aspx?evt19=1&referringHubId=16369"
	},
	{
		name: "Wonton Soup",
		image_url: "http://foodnetwork.sndimg.com/content/dam/images/food/fullset/2009/4/14/0/EM2A34_30372_s4x3.jpg.rend.sni12col.landscape.jpeg",
		description: "I have tryed other recipes but, this by far was the best ever! I made this for my family and they loved it. We all agree that it was better than the restaurants. I followed the recipe and only had to make one change. I didn't have enough broth so I had to use boullion to make up for it. I was afraid of using too much of it because boullion has a very strong flavor and Wonton Soup broth is light so your able to taste everything else. It came out great. I will double the Wonton recipe next time and freeze some for a rainy day. This is going into my permanent recepe box. I tooted my own horn on this one. Try it you'll love it!!!",
		recipe_url: "http://www.foodnetwork.com/recipes/emeril-lagasse/wonton-soup-recipe.html"
	},
	{
		name: "Lentil Soup",
		image_url: "http://foodnetwork.sndimg.com/content/dam/images/food/fullset/2004/4/21/1/ei1c01_lentil_soup.jpg.rend.sni12col.landscape.jpeg",
		description: "This was a huge hit with my picky family. I took the suggestion of some other reviewers, and I did add a bit of red pepper flake and some white wine....DELICIOUS!!!! I think that next time I will use beef broth, red wine, and some fresh rosemary.",
		recipe_url: "http://www.foodnetwork.com/recipes/giada-de-laurentiis/lentil-soup-recipe.html"
	},
	{
		name: "Hearty Escarole, Barley, and Parmesan Soup",
		image_url: "http://www.seriouseats.com/recipes/assets_c/2013/10/20131024-escarole-parmesan-vegetable-soup-09-thumb-625xauto-362276.jpg",
		description: "Served with a drizzle of really good extra virgin olive oil and a grating of cheese and you've got a fall soup so comforting and filling that you'll never question its meatless status.",
		recipe_url: "http://www.seriouseats.com/2013/11/food-lab-hearty-escarole-barley-parmesan-soup-recipe.html"
	},
	{
		name: "Cauliflower Soup",
		image_url: "http://foodnetwork.sndimg.com/content/dam/images/food/fullset/2013/4/10/0/WU0413H_cauliflower-soup-recipe_s4x3.jpg.rend.sni12col.landscape.jpeg",
		description: "this soup was AMAZING!! my family and I enjoyed it so much we made extra sure it made it into our family favoret meals : The only thing i did diferant was I vegitable broth instead, so I hade to add alittle more seasoning then the recipie asked for. Thanks so much for this great family favoret!",
		recipe_url: "http://www.foodnetwork.com/recipes/ree-drummond/cauliflower-soup-recipe.html"
	},
	{
		name: "Chicken Tortilla Soup",
		image_url: "http://foodnetwork.sndimg.com/content/dam/images/food/fullset/2008/6/11/0/RB0112_Chicken-Tortilla-Soup.jpg.rend.sni12col.landscape.jpeg",
		description: "This soup is amazing!!!!! I didn't add the beans because I'm don't like them but everything else worked together amazingly. And the avocado MADE the soup. It added this creaminess and amazing flavor. I'll be saving this recipe and making it again.",
		recipe_url: "http://www.foodnetwork.com/recipes/chicken-tortilla-soup-recipe.html"
	},
	{
		name: "Fully Loaded Vegan Baked Potato Soup",
		image_url: "http://www.seriouseats.com/recipes/assets_c/2015/02/20150202-potato-bacon-cheese-broccoli-cauliflower-soup-vegan-8-thumb-625xauto-418826.jpg",
		description: "Creamy, rich, and packed with nutty, sharp, tangy, cheesy flavor, this 100% vegan loaded potato soup relies on a few secret ingredients and techniques to satisfy even the hungriest eater. Vegan mushroom bacon bits, broccoli, and scallions load it up.",
		recipe_url: "http://www.seriouseats.com/recipes/2015/02/fully-loaded-baked-potato-soup-vegan-recipe.html"
	},
	{
		name: "Homemade Shin Cup-Style Spicy Korean Ramyun Beef Noodle Soup",
		image_url: "http://www.seriouseats.com/recipes/assets_c/2014/01/20140120-beef-ramyun-homemade-recipe-15-thumb-625xauto-378645.jpg",
		description: "A homemade version of Korean-style spicy beef instant noodles made with short ribs, Korean chili paste, and kimchi.",
		recipe_url: "http://www.seriouseats.com/recipes/2014/01/homemade-shin-cup-style-spicy-korean-beef-noo.html"
	},
	{
		name: "Best Tomato Soup Ever",
		image_url: "http://foodnetwork.sndimg.com/content/dam/images/food/fullset/2013/8/7/1/WU0508H_best-tomato-soup-ever-recipe_s4x3.jpg.rend.sni12col.landscape.jpeg",
		description: "Loved the simplicity of this recipe. Used a sweet vidallia onion, only 2 T. Sugar, my home canned 2012 tomatoes and juice, a really good chicken stock, some thyme instead of basil or parsley, and some half and half. Easy, fresh, satisfying and delicious!",
		recipe_url: "http://www.foodnetwork.com/recipes/ree-drummond/best-tomato-soup-ever.html"
	},
	{
		name: "Strawberry Soup",
		image_url: "http://foodnetwork.sndimg.com/content/dam/images/food/fullset/2008/4/7/0/RM0612_Strawberry-Soup.jpg.rend.sni12col.landscape.jpeg",
		description: "Refreshing! I too added some sugar as it was a little tart for my tastes. I also read the other reviews and add the orange juice in batches to keep the strawberry flavor prominate. I also saw another recipe that added a little white wine which added a nice flavor. I thought it was a refreshing start to dinner while my husband thought it should have been more of a dessert course.",
		recipe_url: "http://www.foodnetwork.com/recipes/strawberry-soup-recipe1.html"
	},
	{
		name: "Kale Soup",
		image_url: "http://foodnetwork.sndimg.com/content/dam/images/food/fullset/2015/5/1/0/YW0604H_Kale-and-Chorizo-Soup_s4x3.jpg.rend.sni12col.landscape.jpeg",
		description: "I really liked the soup and added the red pepper flakes that another reviewer recommended.  I might add a bit of cornstarch to the broth to thicken it a little next time.  Otherwise a fantastic recipe. Thanks Trisha!",
		recipe_url: "http://www.foodnetwork.com/recipes/trisha-yearwood/kale-soup.html"
	},
	{
		name: "Hot and Sour Soup",
		image_url: "http://www.seriouseats.com/recipes/assets_c/2014/01/20140113-hot-and-sour-soup-15-thumb-625xauto-377518.jpg",
		description: "That fresh white pepper and vinegar hit? That's the difference between the hot and sour soup that's good enough to keep you satisfied in your own company at home, and the hot and sour soup that's so good you absolutely must take it home to meet the parents. It's the hot and sour soup I fell in love with, but I'm not so selfish I wouldn't share it with you all.",
		recipe_url: "http://www.seriouseats.com/recipes/2014/01/hot-and-sour-soup-food-lab.html"
	},
	{
		name: "Vietnamese Noodle Soup",
		image_url: "http://foodnetwork.sndimg.com/content/dam/images/food/fullset/2009/12/13/0/FNM_011009-W-N-Dinners-011_s4x3.jpg.rend.sni12col.landscape.jpeg",
		description: "Great, easy soup. Very authentic. I used one additional cup of beef broth in place of 1 cup of water and loved the flavor. Also cut the jalepeno. Liked adding the beef at the end so I could keep it medium rare. This is better than I have had in many restaurants. My husband loved it and called it 'a nice change', and its healthy!",
		recipe_url: "http://www.foodnetwork.com/recipes/food-network-kitchens/vietnamese-noodle-soup-recipe.html"
	},
	{
		name: "Broccoli Cheese Soup",
		image_url: "http://foodnetwork.sndimg.com/content/dam/images/food/fullset/2012/2/23/0/WU0204_Broccoli-Cheese-Soup_s4x3.jpg.rend.sni12col.landscape.jpeg",
		description: "WOW! Once again you didn't disappoint, such a simple and tasty soup. The little eaters in my family ate it up (as did the two grown ups!. I used to emulsion blender to chop up the bigger pieces. I willmost certainly make this soup again!",
		recipe_url: "http://www.foodnetwork.com/recipes/ree-drummond/broccoli-cheese-soup-recipe.html"
	},
	{
		name: "Lettuce Soup",
		image_url: "http://foodnetwork.sndimg.com/content/dam/images/food/fullset/2008/10/12/0/EE1102_Lettuce-Soup.jpg.rend.sni12col.landscape.jpeg",
		description: "What a great recipe! My 12 year old loved it and even had seconds! I used different lettuce and didn't have fresh tarragon but it still came out tasting wonderful. I will try it with Boston lettuce and tarragon, I am sure it will be great tasting. A keeper! I love Emeril's recipes - have yet to try one that my family did not like!",
		recipe_url: "http://www.foodnetwork.com/recipes/emeril-lagasse/lettuce-soup-recipe2.html"
	},
	{
		name: "Italian Sausage Soup",
		image_url: "http://images.media-allrecipes.com/userphotos/250x250/00/52/10/521051.jpg",
		description: "This is a fabulous recipe! I also use 1 extra can of broth and then add 1-2 cups of cooked pasta at the end. I have also added a couple stalks of chopped celery which is very tasty as well. Makes a great winter meal with toasted french bread and a glass of wine. Thanks for the fantastic recipe.",
		recipe_url: "http://allrecipes.com/recipe/italian-sausage-soup/detail.aspx?evt19=1&referringHubId=12942"
	},
	{
		name: "Jamie's Minestrone",
		image_url: "http://images.media-allrecipes.com/userphotos/250x250/00/69/17/691795.jpg",
		description: "I created this soup after becoming tired of the excess salt and lack of veggies in canned minestrone. I recalled a great bowl of minestrone that was overflowing with rich vegetables at the 'Sheepherder's Inn' in Sacramento, California. Great with a hearty bread, romaine salad and a nice Merlot!",
		recipe_url: "http://allrecipes.com/recipe/jamies-minestrone/detail.aspx?evt19=1&referringHubId=13333"
	},
	{
		name: "My Best Clam Chowder",
		image_url: "http://images.media-allrecipes.com/userphotos/250x250/00/00/77/7732.jpg",
		description: "A delicious, traditional, cream based chowder, this recipe calls for the standard chowder ingredients: onion, celery, potatoes, diced carrots, clams, and cream. A little red wine vinegar is added before serving for extra flavor.",
		recipe_url: "http://allrecipes.com/recipe/my-best-clam-chowder/detail.aspx?evt19=1&referringHubId=13041"
	},
	{
		name: "Super-Delicious Zuppa Toscana",
		image_url: "http://images.media-allrecipes.com/userphotos/250x250/00/21/60/216012.jpg",
		description: "This is an oh-so-good recipe. Just the right amount of spice to make you take a cold drink but definitely keep coming back for more! This soup is irresistible!",
		recipe_url: "http://allrecipes.com/recipe/super-delicious-zuppa-toscana/detail.aspx?evt19=1&referringHubId=143069"
	},
	{
		name: "Chicken Broccoli Alfredo Soup",
		image_url: "http://img.sndimg.com/food/image/upload/w_555,h_416,c_fit,fl_progressive,q_95/v1/img/recipes/15/53/75/VRO93x3gQ1eF2o5W79WD_DSC_0833.JPG",
		description: "Here's a scrumptious soup served at Dairy Keen (three-time \"Best of State\" winner) of Heber City, Utah. This is a recipe I've not had long, but have made over and over and OVER again. It is that good!",
		recipe_url: "http://www.food.com/recipe/chicken-broccoli-alfredo-soup-155375?photo=371322"
	},
	{
		name: "The Best Potato-Leek Soup",
		image_url: "http://www.seriouseats.com/recipes/assets_c/2014/12/20150105-potato-leek-soup-recipe-07-thumb-625xauto-417406.jpg",
		description: "An easy potato-leek soup that takes no shortcuts to deliver the best flavor and texture possible. A touch of buttermilk and potatoes pressed through a ricer are the secret.",
		recipe_url: "http://www.seriouseats.com/recipes/2015/01/best-potato-leek-soup-recipe.html"
	},
	{
		name: "Black Bean Soup With Chorizo and Braised Chicken",
		image_url: "http://www.seriouseats.com/recipes/assets_c/2014/01/20140113-black-bean-chicken-soup-recipe-13-thumb-625xauto-377008.jpg",
		description: "A hearty bean and chicken stew flavored with chorizo and chipotle chilies. It takes a little time for the flavors to come together, but the process is easy and the results are worth the wait.",
		recipe_url: "http://www.seriouseats.com/recipes/2014/01/the-food-lab-black-bean-chicken-soup-recipe.html"
	},
	{
		name: "Easy Chicken and Ginger Soup With Rice Cakes, Chives, and Quick-Pickled Garlic",
		image_url: "http://www.seriouseats.com/recipes/assets_c/2014/01/20131216-chicken-ginger-soup-2-thumb-625xauto-375618.jpg",
		description: "The final soup has a bit of everything. It's got a Korean soul, amplified by the freshness of cilantro and chives and the heat and vinegar you'd expect in a Thai soup. It's intensely aromatic, warm, soothing, and easy to eat. ",
		recipe_url: "http://www.seriouseats.com/recipes/2014/01/easy-chicken-ginger-soup-rice-cake-chive-quick-pickled-garlic-recipe.html"
	}
])