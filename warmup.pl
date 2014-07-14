%Rex Reynolds

%4/19/2014


% Takes input of a positive Element, an un-empty list, and a positive
% count.
count(Element,[],0).
count(Element,[Element|T],Number1) :-
	count(Element,T,Number2),
	Number1 is 1+Number2.
count(Element,[Variable|T],Number1) :-
	count(Element,T,Number2),
	Number1 is Number2.




%Takes an input of a positive Element, two Lists, and a Number.
takeout(Element,[],[],0).
takeout(Element,[Element|Tail1],Tail2,NumOccur):-
	!,
	takeout(Element,Tail1,Tail2,NumOccur2),
	NumOccur is NumOccur2 +1.
takeout(Element,[Head|Tail1],[Head|Tail2],Variable):-
	takeout(Element,Tail1,Tail2,Variable).





% Takes an input of two lists, a positive element, and a number.
putIn([],Element,0,[]).
putIn(List1,Element,NumOccur,List2):-
	List3=[Element,List1],NumOccur2 is NumOccur -1,
	putIn(List2,Element,NumOccur2,List3),List2=List3.





%Takes a positive element, two lists, and a number.
deleteNum(Element,[],[],0).
deleteNum(Element,[Head|Tail],List1,Variable):-
	not(Head = Element),
	deleteNum(Element,Tail,List2,Variable),
	List1 = [Head|List2].
deleteNum(Element,[Head|Tail],List1,Variable):-
	-Head=Element,
	Variable1 is Variable-1,
	deleteNum(Element,Tail,List2,Variable1),
	List1 = List2.





%Takes two lists and two "sets".
%Uses deleteNum in order to remove the group of fours from the list.
%Uses count to group numbers of four.
groupFours([],Set,[],Set).
groupFours([Head|Tail],Set,NewHand,NewSet):-
	count(Head,[Head|Tail],Number),
	Number < 4,
	groupFours(Tail,Set,NewHand2,NewSet),
	NewHand = [Head|NewHand2].
groupFours([Head|Tail],Set,NewHand,NewSet):-
	count(Head,[Head|Tail],Number),
	not(Number < 4),
	deleteNum(Head,[Head|Tail],NewList,4),
	groupFours(NewList,Set,NewHand,NewSet2),
	NewSet = [Head|NewSet2].
