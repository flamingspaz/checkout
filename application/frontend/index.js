window.addEventListener('load', (event) => {
    fetch('http://localhost:8080')
    .then(response => response.json())
    .then(data => {
        console.log(data.Success)
        if (data.Success) {
            document.getElementById("weatherText").innerHTML = data.Data.Text
            document.getElementById("weatherImage").src = data.Data.ImageLocation
        }
    })
    .catch((err) => {
        console.log(err)
    });;
});
