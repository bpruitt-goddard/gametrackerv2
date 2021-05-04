import React from 'react';
import logo from './logo.svg';
import './App.css';
import Header from './Header';
import { Route, Switch } from 'react-router';
import Home from './components/Home';
import Games from './components/Games';

function App() {
  return (
    <div className="App">
      <Header/>
      <div>
        <Switch>
          <Route exact path="/" component={Home} />
          <Route path="/games" component={Games} />
        </Switch>
      </div>
    </div>
  );
}

export default App;
