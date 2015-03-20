$('.cover').mouseenter(function(event){
  var target = checkCoverElement(event.target);
  $(target).addClass('animated infinite pulse');

  if (target.id === "title"){
    return
  }
  else {
    toggleHoverTile(target, "block", "animated fadeOutDown", "animated fadeInUp")
  }

});

$('.cover').mouseleave(function(event){
  var target = checkCoverElement(event.target);
  $(target).removeClass('animated infinite pulse');

  if (target.id === "title"){
    return
  }
  else {
    toggleHoverTile(target, "none", "animated fadeInUp", "animated fadeOutDown")
  }
});

$('.hover-tile-hidden').mouseleave(function(event){
  var target = checkTileElement(event);
  console.log(target);
  $(target).removeClass('animated infinite pulse');

  toggleHoverTile(target, "none", "animated fadeInUp", "animated fadeOutDown")
})

function checkCoverElement(target){
  if ($(target).hasClass('cover')){
    return target;
  }
  else {
    return target.parentElement;
  }
}

function checkTileElement(event){
  if (event.target.nodeName === "H2"){
    return event.target.parentElement.parentElement.parentElement;
  }
  else if (event.target.nodeName === "A"){
    return event.target.parentElement
  }
  else {
    return event.target.parentElement.parentElement;
  }
}

function toggleHoverTile(target, display, classToRemove, classToAdd){

  var tile = target.children[1].children[0];
  $(tile).removeClass(classToRemove).addClass(classToAdd).css("display", display);

  getHeight(target, tile);
}

function getHeight(target, tile){
  var target_height = target.children[0].clientHeight+10;
  var tile_position = (target_height*(-1));
  $(tile).innerHeight(target_height).css("margin-top", tile_position);
}
