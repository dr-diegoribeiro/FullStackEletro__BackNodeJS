import Menu from './Components/Menu/Menu';
import Rotas from './Rotas.js';
import Footer from './Components/Footer/Footer.js'
import './App.js';




function App() {
  return (
    <div className="App">
      <header>
        <Menu />
      </header>
      <main>
        <Rotas />
      </main>
      <footer>
       <Footer />
      </footer>
    </div>
  );
}

export default App;
