extends Node

var character_tag_BALD_MAN = "bald_man"
var character_tag_SOLDIER = "soldier"
var character_tag_WOMAN = "woman"
var character_tag_MELODY = "melody"
var character_tag_VICA = "vica"
var character_tag_JARED = "jared"
var character_tag_CLARRISA = "clarrisa"
var character_tag_WALTER = "clarrisa"
var character_tag_DELI = "deli"
var character_tag_TYLER = "tyler"
var characters = {
	character_tag_BALD_MAN: preload("res://characters/test_character1.dch"),
	character_tag_SOLDIER: preload("res://characters/soldier_character.dch"),
	character_tag_MELODY: preload("res://characters/melody_character.dch"),
	character_tag_VICA : preload("res://characters/vica_character.dch"),
	character_tag_JARED : preload("res://characters/jared_character.dch"),
	character_tag_CLARRISA : preload("res://characters/clarrisa_character.dch"),
	character_tag_WALTER : preload("res://characters/clarrisa_character.dch"),
	character_tag_DELI : preload("res://characters/deli_character.dch"),
	character_tag_TYLER: preload("res://characters/tyler_character.dch")
	}

#var pre_dialog_options = {
	#character_tag_SOLDIER:[
		#["I never thought i'd join the war.", "But when big brother made the call, of course i had to answer.", "But anyways I am in need of a mask"],
		#["The war was terrible.", "So much carnage", "I was told i need a new mask, but i'm not sure of anything anymore."]],
	#character_tag_BALD_MAN:[
		#["Its hard being as handsome as I am"," No if you are wondering I am not balding","Anyways it's none of your business. Just sell me a mask"],
		#["Life is quite hard these days.","My wife says I've allowed the stress to get to me but I am still who I am.","I just wish these masks weren't nece-.","Apologies. One mask please"]],
	#character_tag_MELODY:[["",""],[""]]
#}
##Give Big brother mask
#var post_mask_1_dialog_options = {
	#character_tag_SOLDIER:[
		#["Oh how perfect.", "Thank you seller." ,"Lo Big Brother and good day to you."],
		#["Ah.", "I see.", "Thank you I geuss."]],
	#character_tag_BALD_MAN:[["Hmm. it will do.", "Lo Big Brother"],
		#["Oh. That is a choice.", "Thank you and goodbye"]]
	#
#}
##Give Rebellion Mask
#var post_mask_2_dialog_options = {
	#character_tag_SOLDIER:[
		#["No No this can't be right.", "You are most unreputable." ,"Good day to you. and may we never coss paths again."],
		#["wha-", "Are you sure?", "Thank you my friend. Shall we meet again."]],
	#character_tag_BALD_MAN:[
		#["My word, this is hideous", "You'll be hearing complaints from me"],
		#["Oh. How surprising", "But I quite  like it", "Thank you"]
	#]
#}\

#1 is ANTI BIG BROTHER
#2 is PRO BIBROTHER

#PRO BIG BOTHER MASK
# BIG BROTHER MASK (player choice text)
var post_mask_1_player_options = {
	character_tag_VICA:[
		# Anti Vica -> Big Brother mask choice
		["Here’s your mask."],
		# Pro Vica -> Big Brother mask choice
		["Here’s your mask."]
	],

	character_tag_JARED:[
		# Anti Jared -> Big Brother mask choice
		["Here’s your mask."],
		# Pro Jared -> Big Brother mask choice
		["Here’s your mask."]
	],

	character_tag_CLARRISA:[
		# Anti Clarrisa -> Big Brother mask choice
		["Here’s your mask."],
		# Pro Clarrisa -> Big Brother mask choice
		["Here’s your mask."]
	],

	character_tag_WALTER:[
		# Anti Walter -> Big Brother mask choice
		["Here’s your mask."],
		# Pro Walter -> Big Brother mask choice
		["Here’s your mask."]
	],

	character_tag_DELI:[
		# Anti Deli -> Big Brother mask choice
		["Here’s your mask."],
		# Pro Deli -> Big Brother mask choice
		["Here’s your mask."]
	],

	character_tag_TYLER:[
		# Anti Tyler -> Big Brother mask choice
		["Here’s your mask."],
		# Pro Tyler -> Big Brother mask choice
		["Here’s your mask."]
	],

	character_tag_MELODY:[
		# Anti Melody -> Big Brother mask choice
		["Here’s your mask."],
		# Pro Melody -> Big Brother mask choice
		["Here’s your mask."]
	]
}

# REBELLION MASK (player choice text)
var post_mask_2_player_options = {
	character_tag_VICA:[
		# Anti Vica -> Rebellion mask choice
		["I feel like this mask is a better fit for you."],
		# Pro Vica -> Rebellion mask choice
		["I feel like this mask is more your style."]
	],

	character_tag_JARED:[
		# Anti Jared -> Rebellion mask choice
		["Does this mask pique your interest?"],
		# Pro Jared -> Rebellion mask choice
		["Does this mask pique your interest?"]
	],

	character_tag_CLARRISA:[
		# Anti Clarrisa -> Rebellion mask choice
		["Why not change things before it’s too late?"],
		# Pro Clarrisa -> Rebellion mask choice
		["Things are good now, how could you be sure they will stay that way?"]
	],

	character_tag_WALTER:[
		# Anti Walter -> Rebellion mask choice
		["Both you and your dog deserve to be free."],
		# Pro Walter -> Rebellion mask choice
		["Lack of choice is far different from freedom of choice."]
	],

	character_tag_DELI:[
		# Anti Deli -> Rebellion mask choice
		["This isn’t The Truman Show, this is life or death, and it’s time for us to fight back."],
		# Pro Deli -> Rebellion mask choice
		["Why wait for your demise when you can fight for the future you want?"]
	],

	character_tag_TYLER:[
		# Anti Tyler -> Rebellion mask choice
		["You don’t have to be scared; you can make a difference, so nobody in your family is scared anymore."],
		# Pro Tyler -> Rebellion mask choice
		["Candy and toys, he thinks you’re not smart enough to see the truth."]
	],

	character_tag_MELODY:[
		# Anti Melody -> Rebellion mask choice
		["Join our cause, and nobody will put a finger on you or your baby without consequence!"],
		# Pro Melody -> Rebellion mask choice
		["They’re taking your kid to brainwash them; you must not free only yourself, but him too."]
	]
}

var pre_dialog_options = {
	character_tag_VICA:[
		# Anti Big Brother
		[
			"Another day in this hellhole, funny thing is, I thought there would be more money in hell. Rumors…",
			"It’s a shame big brother is interfering with my business now. At first, my clients were too scared to show up to our date, but I’m still a convincing woman. Now I have to hide my money maker with this dumb mask. What’s next, full body armour?",
			"Anyways, I need a new mask; this current one is starting to crack."
		],
		# Pro Big Brother
		[
			"Somehow, Big Brother’s rule has been perfect for business lately. The more stressed he makes my client, the more often they book appointments with me.",
			"It's either that or I’ve gotten hotter….",
			"Anyways, ring me up on the register for a new mask, this one has been looking a bit duller lately. I need something that reminds my clients how much they need me."
		]
	],

	character_tag_JARED:[
		# Anti Big Brother
		[
			"Box…after box. All those years spent in college just to do manual, back-breaking labor.",
			"Feels like a nightmare, but somehow I felt my future would end up like this one way or another.",
			"My mask didn’t pass last week’s uniform inspection, apparently is shows too much of my soulless eyes.",
			"So, one mask, please."
		],
		# Pro Big Brother
		[
			"Another day under the rule of Big Brother.",
			"Hey, my pay got raised by an extra 3 cents today. Things are getting better slowly, but surely.",
			"I want to make sure I breeze through my job’s upcoming uniform inspection.",
			"One mask, please."
		]
	],

	character_tag_CLARRISA:[
		# Anti Big Brother
		[
			"It’s weird… lately, my coworkers have been disappearing one by one.",
			"My boss claims that they didn’t meet the job’s requirements. How long until I don’t meet these requirements, whatever they are?",
			"I need a new mask; this one is a bit old, and I can’t risk anything not being up to par right now."
		],
		# Pro Big Brother
		[
			"Another day of order and structure, just how I like it.",
			"Is it me, or has the sun felt just a tad bit warmer, like a big warm fuzzy hug?",
			"One new mask, please. I want this new one to be extra shiny."
		]
	],

	character_tag_WALTER:[
		# Anti Big Brother
		[
			"I’m scared. Big Brother has been taking conntrol everything as of lately. What if Big Brother bans pets next?  My dog is the only joy I have left in this broken, dark world.",
			"Every night, I pace around my house thinking of plans to escape if they ever come for him. I tripped while pacing last night, and my mask fell and split in half. Now, the only thing keeping my mask together is ductape.",
			"One new mask, please."
		],
		# Pro Big Brother
		[
			"Now that Big Brother is in charge, I know I have nothing to worry about. He tells us what to eat and what to wear. The more control he takes, the more in control I feel.",
			"I know it’s weird, but I feel like he knows what's right for me.. for all of us.",
			"One new mask, please."
		]
	],

	character_tag_DELI:[
		# Anti Big Brother
		[
			"I always thought school was systematic, but ever since Big Brother has taken over, I’m certain we’re living in The Truman Show.",
			"This sucks. Not to mention masks are apparently mandated now.",
			"I tried making my own, but it doesn’t have a state-issued serial number. I’m tired of getting in trouble for it at school, so I’m here for my lame state-issued mask."
		],
		# Pro Big Brother
		[
			"This world has always been a shit hole, but it has never been my problem.",
			"I can’t wait till big brother decides to exterminate us all. At least I won’t have to work in the Big Brother Warehouse when I graduate. Only the chosen ones get into Big Brother Corpo, I always knew nepotism would reach a new height.",
			"Anyways, I need a new mask, I’m tired of getting stopped by soldiers for not having a government-issued one."
		]
	],

	character_tag_TYLER:[
		# Anti Big Brother
		[
			"Hello…",
			"My dad sent me in for a new mask. He said big brother doesn’t allow us to color on them.",
			"I can tell my dad is scared; everyone seems scared. Why won’t anyone stand up to Big Brother?",
			"One mask, please, sir."
		],
		# Pro Big Brother
		[
			"Hello…Today, Big Brother’s soldiers visited our school. Our teachers always told us that Big Brother is great and loves us all, but I never believed it until all the soldiers handed us teddy bears and candy.",
			"Dad hasn’t been able to afford candy for me lately, but I was able to share the candy from school with my whole family.",
			"I want a brand new big brother mask to show big brother I love him too!"
		]
	],

	character_tag_MELODY:[
		# Anti Big Brother
		[
			"I have been hearing rumours of Big Brother taking away babies to raise them “the proper way.”",
			"I’ll do anything for this little one… anything.",
			"I need a new mask; the least I can do is follow his rules, and maybe he’ll spare my child."
		],
		# Pro Big Brother
		[
			"I heard big brother is planning to take babies to a schooling program, which starts right after they’re born.",
			"They said they will provide them all with the proper conditions to grow healthy and they will be garunteed corportae jobs.",
			"I want the best for my kid, and even though I’m stuck working in a warehouse, I’ll do anything to garuntee charlie has a better future than me. I need a mask; little Charlie nibbled on this one."
		]
	]
}

# Give Big Brother mask
var post_mask_1_dialog_options = {
	character_tag_VICA:[
		["Things will never change, huh?"],
		["Thank you, handsome."]
	],
	character_tag_JARED:[
		["Thanks."],
		["Thanks, man!"]
	],
	character_tag_CLARRISA:[
		["Thanks…"],
		["Thanks, maybe if you keep working hard, you’ll be in corporate just like me."]
	],
	character_tag_WALTER:[
		["Another day to survive, but another day to worry about."],
		["Thanks, man, and cheer up, big brother will work it all out for us,"]
	],
	character_tag_DELI:[
		["Nobody stands for anything these days, especially loser adults like you!"],
		["Hey man, the world was always burning, the fire just feels a bit hotter these days."]
	],
	character_tag_TYLER:[
		["Thanks, sir. Maybe someday things will change."],
		["Thanks, sir. Maybe if you keep being good, Big Brother will give you candy too!"]
	],
	character_tag_MELODY:[
		["Thank you. Please pray for me and my child."],
		["Thank you."]
	]
}

# Give Rebellion Mask
var post_mask_2_dialog_options = {
	character_tag_VICA:[
		["Hmm… this one certainly is more stylish."],
		["I may work under the table, but I want nothing to do with that."]
	],
	character_tag_JARED:[
		["I’m hesitant, but I know this is the only way for us to change things."],
		["Hey man, I don’t know what gang you’re a part of, but keep me out of it!"]
	],
	character_tag_CLARRISA:[
		["Thanks for giving me hope."],
		["Typical response from an underling such as yourself, I don’t want that filthy mask."]
	],
	character_tag_WALTER:[
		["Wow, thank you. Buttercup and I will be joining your cause."],
		["Are you crazy? Don’t tell anyone I saw that mask. Are you trying to get us both killed?"]
	],
	character_tag_DELI:[
		["Hell yeah , now this is the mask I want to wear!"],
		["Lame, there’s no way you have enough people to go against Big Brother, get somebody else to throw their life away."]
	],
	character_tag_TYLER:[
		["Thank you! I’m going to stand up to Big Brother, and maybe my dad will too."],
		["You’re going to get in big trouble if you keep this up, sir."]
	],
	character_tag_MELODY:[
		["I’ll join!"],
		[
			"You think you know what’s best because you don’t have a child of your own.",
			"Put that thing away and don’t get anyone else wrapped up in your death wish."
		]
	]
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
