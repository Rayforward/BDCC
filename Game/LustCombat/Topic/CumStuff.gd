extends TopicBase

func _init():
	handles_ids = [
		InterestTopic.StuffedPussy,
		InterestTopic.StuffedAss,
		InterestTopic.StuffedPussyOrAss,
		InterestTopic.StuffedThroat,
		InterestTopic.CoveredInCum,
		InterestTopic.CoveredInLotsOfCum,
	]

func getTopicValue(_topicID, _pc):
	var messiness = _pc.getOutsideMessinessLevel()
	var isButtStuffed = !_pc.getBodypart(BodypartSlot.Anus).isOrificeEmpty()
	var isPussyStuffed = false
	var isThroatStuffed = !_pc.getBodypart(BodypartSlot.Head).isOrificeEmpty()
	if(_pc.hasBodypart(BodypartSlot.Vagina)):
		isPussyStuffed = !_pc.getBodypart(BodypartSlot.Vagina).isOrificeEmpty()
	
	if(_topicID == InterestTopic.CoveredInCum):
		if(messiness >= 1.0):
			return 1.0
		else:
			return 0.0

	if(_topicID == InterestTopic.CoveredInLotsOfCum):
		if(messiness > 0):
			return constantIfAbove(messiness, 5.0, 1.0, linearCloseness(messiness, 5.0, 5.0))
		else:
			return 0.0
	
	if(_topicID == InterestTopic.StuffedPussy):
		return float(isPussyStuffed)
	
	if(_topicID == InterestTopic.StuffedAss):
		return float(isButtStuffed)
	
	if(_topicID == InterestTopic.StuffedPussyOrAss):
		return float(isButtStuffed || isPussyStuffed)
	
	if(_topicID == InterestTopic.StuffedThroat):
		return float(isThroatStuffed)
	
	return 0

func getVisibleName(_topicID):
	if(_topicID == InterestTopic.StuffedPussy):
		return "a creamed pussy"
	if(_topicID == InterestTopic.StuffedAss):
		return "a cum-stuffed ass"
	if(_topicID == InterestTopic.StuffedPussyOrAss):
		return "any used hole"
	if(_topicID == InterestTopic.StuffedThroat):
		return "cum eaters"
	if(_topicID == InterestTopic.CoveredInCum):
		return "sluts covered with cum"
	if(_topicID == InterestTopic.CoveredInLotsOfCum):
		return "total cumdumpsters"
	
	return "error:"+str(_topicID)

func getTeaseValue(_topicID, _teaseType):
	if(_teaseType == TeaseType.Body):
		if(_topicID in [InterestTopic.StuffedThroat, InterestTopic.CoveredInCum, InterestTopic.CoveredInLotsOfCum]):
			return 0.6
	if(_teaseType == TeaseType.Crotch):
		if(_topicID in [InterestTopic.StuffedPussy, InterestTopic.StuffedPussyOrAss]):
			return 0.6
	if(_teaseType == TeaseType.Butt):
		if(_topicID in [InterestTopic.StuffedAss, InterestTopic.StuffedPussyOrAss]):
			return 0.6
	return 0.0
