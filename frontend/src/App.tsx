import React from 'react';
import logo from './logo.svg';
import './App.css';
import Header from './Header';
import { Route, Switch } from 'react-router';
import Home from './components/Home';
import GameList from './components/game/List';
import PlayerList from './components/player/Index';
import SessionList from './components/session/Index';
import Search from './components/Search';

function App() {
  return (
    <div className="App">
      <Header/>
      <div>
        <Switch>
          <Route exact path="/" component={Home} />
          <Route path="/games" component={GameList} />
          <Route path="/players" component={PlayerList} />
          <Route path="/sessions" component={SessionList} />
          <Route path="/search" component={Search} />
        </Switch>
      </div>
    </div>
  );
}

export default App;
