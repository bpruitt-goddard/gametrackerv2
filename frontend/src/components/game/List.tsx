import { useEffect, useState } from 'react';
import { Link, Route, Switch } from 'react-router-dom';
import { Button, Table } from 'reactstrap';
import { getGames } from '../../services/games';
import { IGame } from '../../services/type';
import GameAddEdit from './AddEdit';
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
            <Switch>
                <Route path="/games/add" component={GameAddEdit} />
                <Route path="/games/:id/edit" component={GameAddEdit} />
                <Route path="/games/:id" component={GameIndex} />
                <Route render={() => GetGames()} />
            </Switch>
        </div>
    );

    function GetGames() {
        return (
            <div>
                <h1>Games</h1>
                <Link
                    to={`/games/add`}
                    color="primary"
                    className="btn btn-success"
                    style={{float: 'left'}}>
                        Add
                </Link>
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
                                        <td>
                                            <Link to={`/games/${g.id}`}>{g.name}</Link>
                                        </td>
                                        <td>{g.id}</td>
                                        <td>{g.game_type}</td>
                                        <td>
                                            <Link
                                                to={`/games/${g.id}/edit`}
                                                color="primary"
                                                className="btn btn-primary">
                                                    Edit
                                            </Link>{' '}
                                            <Button color="danger">Delete</Button>
                                        </td>
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