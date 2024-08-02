window.onload=()=>{
	for(let i=1; i<=7; i++){
		let img=document.createElement('img') // <img>
		img.src='mm'+i+'.jpg'
		img.width=120
		img.height=200
		img.title='영화명'
		// <img src="" width="" height="" title="">
		document.body.appendChild(img)
	}
}
