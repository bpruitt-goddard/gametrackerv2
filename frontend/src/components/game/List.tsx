import { useState } from 'react';
import { Link, Route, Switch } from 'react-router-dom';
import { Table } from 'reactstrap';
import { IGame } from '../../services/type';
import GameIndex from './Index';

function List() {

    const [list, setList] = useState<IGame[]>([{id: 2, name: 'hello', bgg_id: 55, game_type: 'all'}]);

    return (
        <div>
            <h2>Game</h2>
            Game page!
            <Switch>
                <Route path="/games/:id" component={GameIndex} />
                <Route render={() => GetGames()} />
            </Switch>
        </div>
    );

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
                            list.map(g => {
                                return (
                                    <tr key={g.id}>
                                        <th>
                                            <Link to={`games/${g.id}`}>{g.name}</Link>
                                        </th>
                                        <th>{g.id}</th>
                                        <th>{g.game_type}</th>
                                    </tr>
                                );
                            })
                        }
                    </tbody>
                </Table>
            </div>
        )
    }
}

export default List;