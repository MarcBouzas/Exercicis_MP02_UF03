var firebaseConfig = {
    apiKey: "AIzaSyDgFgr6wG76RZpgtRNexdiyANneLg3CyOg",
    authDomain: "test-64048.firebaseapp.com",
    projectId: "test-64048",
    storageBucket: "test-64048.appspot.com",
    messagingSenderId: "912537845800",
    appId: "1:912537845800:web:75ca3a59423c8dccf4f51d"
  };
// Initialize Firebase
firebase.initializeApp(firebaseConfig);
// firebase.analytics();

const db = firebase.firestore();
db.collection('recipes');

const list = document.querySelector('ul');
const addRecipe = recipe => {
let formattedTime = recipe.created_at.toDate();
   let html = `
       <li>
           <div>${recipe.title}</div>
           <div>${formattedTime}</div>
       </li>
   `;
   list.innerHTML += html;
};
db.collection('recipes').get()
   .then(snapshot => {
       // console.log(snapshot.docs[0].data());
       snapshot.forEach(doc => {
           // console.log(doc.data());
           addRecipe(doc.data());
       });
   })
   .catch(err => console.log(err));
const form = document.querySelector('form');
// add documents
form.addEventListener('submit', e => {
    e.preventDefault();
    let now = new Date();
    const recipe = {
        title: form.recipe.value,
        created_at: firebase.firestore.Timestamp.fromDate(now)
    };
    db.collection('recipes').add(recipe)
    .then(() => console.log('recipe added!'))
    .catch(err => console.log(err))
});