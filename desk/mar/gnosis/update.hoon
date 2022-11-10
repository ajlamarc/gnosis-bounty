/-  *gnosis
=,  enjs:format
|_  upd=update
++  grab
  |%
  ++  noun  update
  --
++  grow
  |%
  ++  noun  upd
  ++  json
    ?-  -.upd
    %address-book
      (parse-address-book address-book.upd)
    %added-safes
      (parse-added-safes safes.upd)
    %owned-safes
      (parse-owned-safes owned-safes.upd)
    %session
      (parse-session session.upd)
    %preloaded-state
      (make-state-object preloaded-state.upd)
    %test-num
      %-  pairs
      :~
        ['confirmation' (tape "Successful sub {<num.upd>}")]
      ==
    ==
  ++  make-state-object
    |=  stat=preloaded-state
    %-  pairs
    :~  
        'addedSafes'^(parse-added-safes -.stat)
        'addressBook'^(parse-address-book +<.stat)
        'session'^(parse-session +>.stat)
    ==
  ++  parse-added-safes
    |=  =safes
    :-  %o
    %-  ~(run by safes)
    |=  safe=(map @t [@ud @t (list @t)])
    :-  %o
    %-  ~(run by safe)
    |=  [thresh=@ud ethebal=@t owners=(list @t)]
    %-  pairs
    :~  'ethBalance'^s/ethebal
        'threshold'^(numb thresh)
        'owners'^a/(turn owners :(corl (cury frond %value) ^json (lead %s)))
    ==  
  ::
  ++  parse-address-book
    |=  book=address-book
    :-  %o
    %-  ~(run by book)
    |=(buk=(map @t @t) o/(~(run by buk) (lead %s))) 
  ::
  ++  parse-owned-safes
    |=  =owned-safes
    =-  (frond 'ownedSafes'^o/-)
    %-  ~(run by owned-safes)
    |=  owned=(map @t (list @t))
    :-  %o
    %-  ~(run by owned)
    |=  [safs=(list address=@t)]
    a/(turn safs :(corl ^json (lead %s)))
  ++  parse-session
    |=  s=session
    %-  pairs
    :~  'lastChainId'^s/-.s
        'lastSafeAddress'^o/(~(run by +.s) (lead %s))
    ==
  --
++  grad  %noun
--