import { useEffect, useState } from 'react';
import { Link, Route, Switch } from 'react-router-dom';
import { Table } from 'reactstrap';
import { getGames } from '../../services/games';
import { IGame } from '../../services/type';
import GameIndex from './Index';

function List() {
    const [list, setList] = useState<IGame[]>([]);

    useEffect(() => {
        getGames<IGame[]>()
          .then(games => {
            setList(games);
        })
    }, [])

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
                        <tr>
                            <th>Name</th>
                            <th>Bgg Id</th>
                            <th>Game Type</th>
                            <th></th>
                        </tr>
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