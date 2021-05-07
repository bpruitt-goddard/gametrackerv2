import React from 'react';
import logo from './logo.svg';
import './App.css';
import Header from './Header';
import { Route, Switch } from 'react-router';
import Home from './components/Home';
import Games from './components/Games';
import Players from './components/Players';
import Sessions from './components/Sessions';
import Search from './components/Search';

function App() {
  return (
    <div className="App">
      <Header/>
      <div>
        <Switch>
          <Route exact path="/" component={Home} />
          <Route path="/games" component={Games} />
          <Route path="/players" component={Players} />
          <Route path="/sessions" component={Sessions} />
          <Route path="/search" component={Search} />
        </Switch>
      </div>
    </div>
  );
}

export default App;
