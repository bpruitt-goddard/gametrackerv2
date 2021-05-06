import { Link, Route, Switch } from 'react-router-dom';
import { Table } from 'reactstrap';
import Game from './Game';

function Games() {
    return (
        <div>
            <h2>Game</h2>
            Game page!
            <Switch>
                <Route path="/games/:id" component={Game} />
                <Route render={() => GetGames()} />
            </Switch>
        </div>
    );
}

function GetGames() {
    return (
        <div>
            <Table>
                <thead>
                    <th>Name</th>
                    <th>Bgg Id</th>
                    <th>Game Type</th>
                    <th></th>
                </thead>
                <tbody>
                    {
                        [1,2,3,4,5].map(n => {
                            return (
                                <tr key={n}>
                                    <th>
                                        <Link to={`games/${n}`}>Game {n}</Link>
                                    </th>
                                    <th>{n}</th>
                                    <th>Competitive</th>
                                </tr>
                            );
                        })
                    }
                </tbody>
            </Table>
        </div>
    )
}

export default Games;