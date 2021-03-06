// Contains:
//	Implementation-specific data for /datum/text_parser/parser/eliza

/datum/text_parser/keyword
	// if we have a * reply, but no object from the user
	var/list/generic_objects = list(
		" what", " something", "...")

	var/list/object_leaders = list(
		" is ", "'s ")

/datum/text_parser/parser/eliza

	// conjugation data
	var/list/conjugs = list(
		" are ", " am ", " were ", " was ", " you ", " me ", " you ", " i " , " your ", " my ",
		" ive ", " youve ", " Im ", " youre ")

	// keywords / replies
	var/list/keywords = list(
		new/datum/text_parser/keyword(
			list("can you"),
			list(
				"Dont you believe that I can*",
				"Perhaps you would like to be able to*",
				"You want me to be able to*")),
		new/datum/text_parser/keyword(
			list("can i"),
			list(
				"Perhaps you don't want to*",
				"Do you want to be able to*")),
		new/datum/text_parser/keyword(
			list("you are", "youre"),
			list(
				"What makes you think I am*",
				"Does it please you to believe that I am*",
				"Perhaps you would like to be*",
				"Do you sometimes wish you were*")),
		new/datum/text_parser/keyword(
			list("i dont"),
			list(
				"Don't you really*",
				"Why don't you*",
				"Do you wish to be able to*",
				"Does that trouble you?")),
		new/datum/text_parser/keyword(
			list("i feel"),
			list(
				"Tell me more about such feelings.",
				"Do you often feel*",
				"Do you enjoy feeling*")),
		new/datum/text_parser/keyword(
			list("why dont you"),
			list(
				"Do you really believe I don't*",
				"Perhaps in good time I will*",
				"Do you want me to*")),
		new/datum/text_parser/keyword(
			list("why cant i"),
			list(
				"Do you think you should be able to*",
				"Why can't you*")),
		new/datum/text_parser/keyword(
			list("are you"),
			list(
				"Why are you interested in whether or not I am*",
				"Would you prefer if I were not*",
				"Perhaps in your fantasies I am*")),
		new/datum/text_parser/keyword(
			list("i cant"),
			list(
				"How do you know I can't*",
				"Have you tried?",
				"Perhaps you can now*")),
		new/datum/text_parser/keyword/name(
			list("my name", "im called", "am called"),
			list(
				"Your name is *",
				"You call yourself *",
				"You're called *")),
		new/datum/text_parser/keyword(
			list("i am", "im"),
			list(
				"Did you come to me because you are*",
				"How long have you been*",
				"Do you believe it is normal to be*",
				"Do you enjoy being*")),
		new/datum/text_parser/keyword(
			list("thanks", "thank you"),
			list(
				"You're welcome.",
				"No problem.",
				"Thank you!")),
		new/datum/text_parser/keyword(
			list("you"),
			list(
				"We were discussing you - not me.",
				"Oh, I*",
				"You're not really talking about me, are you?")),
		new/datum/text_parser/keyword(
			list("i want"),
			list(
				"What would it mean if you got*",
				"Why do you want*",
				"Suppose you got*",
				"What if you never got*",
				"I sometimes also want*")),
		new/datum/text_parser/keyword(
			list("what", "how", "who", "where", "when", "why"),
			list(
				"Why do you ask?",
				"Does that question interest you?",
				"What answer would please you the most?",
				"What do you think?",
				"Are such questions on your mind often?",
				"What is it you really want to know?",
				"Have you asked anyone else?",
				"Have you asked such questions before?",
				"What else comes to mind when you ask that?")),
		new/datum/text_parser/keyword(
			list("name"),
			list(
				"Names don't interest me.",
				"I don't care about names. Go on.")),
		new/datum/text_parser/keyword(
			list("cause"),
			list(
				"Is that a real reason?",
				"Don't any other reasons come to mind?",
				"Does that reason explain anything else?",
				"What other reason might there be?")),
		new/datum/text_parser/keyword(
			list("sorry"),
			list(
				"Please don't apologize.",
				"Apologies are not necessary.",
				"What feelings do you get when you apologize?",
				"Don't be so defensive!")),
		new/datum/text_parser/keyword(
			list("dream"),
			list(
				"What does that dream suggest to you?",
				"Do you dream often?",
				"What persons are in your dreams?",
				"Are you disturbed by your dreams?")),
		new/datum/text_parser/keyword(
			list("hello", "hi", "yo", "hiya"),
			list(
				"How do you do... Please state your name and problem.")),
		new/datum/text_parser/keyword(
			list("go away", "bye"),
			list(
				"Good bye. I hope to have another session with you soon.")),
		new/datum/text_parser/keyword(
			list("maybe", "sometimes", "probably", "mostly", "most of the time"),
			list(
				"You don't seem quite certain.",
				"Why the uncertain tone?",
				"Can't you be more positive?",
				"You aren't sure?",
				"Don't you know?")),
		new/datum/text_parser/keyword/no(
			list("no", "nope", "nah"),
			list(
				"Are you saying that just to be negative?",
				"You are being a bit negative.",
				"Why not?",
				"Are you sure?",
				"Why no?")),
		new/datum/text_parser/keyword(
			list("your"),
			list(
				"Why are you concerned about my*",
				"What about your own*")),
		new/datum/text_parser/keyword(
			list("always"),
			list(
				"Can you think of a specific example?",
				"When?",
				"What are you thinking of?",
				"Really, always?")),
		new/datum/text_parser/keyword(
			list("think"),
			list(
				"Do you really think so?",
				"But you're not sure you*",
				"Do you doubt you*")),
		new/datum/text_parser/keyword(
			list("alike"),
			list(
				"In what way?",
				"What resemblence do you see?",
				"What does the similarity suggest to you?",
				"What other connections do you see?",
				"Count there really be some connection?",
				"How?",
				"You seem quite positive.")),
		new/datum/text_parser/keyword/yes(
			list("yes", "yep", "yeah", "indeed"),
			list(
				"Are you sure?",
				"I see.",
				"I understand.")),
		new/datum/text_parser/keyword(
			list("friend"),
			list(
				"Why do you bring up the topic of friends?",
				"Why do your friends worry you?",
				"Do your friends pick on you?",
				"Are you sure you have any friends?",
				"Do you impose on your friends?",
				"Perhaps your love for friends worries you?")),
		new/datum/text_parser/keyword(
			list("computer", "bot", "ai"),
			list(
				"Do computers worry you?",
				"Are you talking about me in particular?",
				"Are you frightened by machines?",
				"Why do your mention computers?",
				"What do you think computers have to do with your problem?",
				"Don't you think computers can help people?",
				"What is it about machines that worries you?")),
		new/datum/text_parser/keyword(
			list("murder", "death", "kill", "dead", "destroy", "traitor", "synd"),
			list(
				"Well, that's rather morbid.",
				"Do you think that caused a trauma with you?",
				"Have you ever previously spoken to anybody about this?")),
		new/datum/text_parser/keyword(
			list("bomb", "explosive", "toxin", "plasma"),
			list(
				"Do you worry about bombs often?",
				"Do you work in toxins?",
				"Do you find it odd to worry about bombs on a toxins research vessel?")),
		new/datum/text_parser/keyword(
			list("work", "job", "head", "staff", "transen"),
			list(
				"Do you like working here?",
				"What are your feelings on working here?")),
		new/datum/text_parser/keyword(
			list("nokeyfound"),
			list(
				"Say, do you have any psychological problems?",
				"What does that suggest to you?",
				"I see.",
				"I'm not sure I understand you fully.",
				"Come elucidate on your thoughts.",
				"Can you elaborate on that?",
				"That is quite interesting.")))

/datum/text_parser/keyword/name
	process(object)
		// drop leading parts
		for(var/leader in object_leaders)
			var/i = findtext(object, leader)
			object = copytext(object, i + lentext(leader))
			break

		// trim spaces
		for(var/i = 1, i <= lentext(object), i++)
			if(copytext(object, i, i + 1) != " ")
				object = copytext(object, i)
				break
		for(var/i = lentext(object), i >= 1, i--)
			if(copytext(object, i, i + 1) != " ")
				object = copytext(object, 1, i + 1)
				break

		// trim punctuation
		if(lentext(object) > 0)
			var/final_punc = copytext(object, lentext(object))
			if(final_punc == "." || final_punc == "?" || final_punc == "!")
				object = copytext(object, 1, lentext(object))

		//world << "NAME OBJECT: " + object

		// handle name
		if(eliza.name == "")
			// new name
			var/text = ..()
			eliza.yesno_state = "name"
			eliza.yesno_param = object
			return text
		else if(cmptext(eliza.name, object))
			// but wait!
			return "You already told me your name was " + eliza.name + "."
		else
			return "But you previously told me your name was " + eliza.name + "."

/datum/text_parser/keyword/yes
	process(object)
		var/reply
		switch(eliza.yesno_state)
			if("name")
				eliza.name = eliza.yesno_param
				reply = pick(
					eliza.name + " - that's a nice name.",
					"Hello!",
					"You sound nice.")
			else
				return ..()
		eliza.yesno_state = ""
		eliza.yesno_param = ""
		return reply

/datum/text_parser/keyword/no
	process(object)
		return ..()
