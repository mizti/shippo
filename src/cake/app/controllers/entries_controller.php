<?php
class EntriesController extends AppController {
  //           controlle name
  var $name = 'Entries';
  //                 modelname
  var $uses = array('Entry');

  function index()
    { //var '$entries' can be used in view. 'Entry' of $this->Entry is model.
      $this->set('entries', $this->Entry->findAll(null, null, 'Entry.created ASC'));
    }
}
