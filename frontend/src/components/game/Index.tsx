import { FC, useEffect, useState } from 'react';
import { RouteComponentProps } from 'react-router-dom';
import { Col, Container, Row } from 'reactstrap';
import { getGame } from '../../services/games';
import { IGame } from '../../services/type';
import { IGameProps } from './IGameProps';

const Index : FC<RouteComponentProps<IGameProps>> = props => {
    const { id } = props.match.params;
    const [game, setGame] = useState<IGame>();

    useEffect(() => {
        getGame<IGame>(+id)
            .then(game => {
                setGame(game);
            })
    }, [])

    return (
        <Container>
            <Row>
                <Col>
                    <h1>{game?.name}</h1>
                </Col>
            </Row>
            <Row>
                <Col xs="6">Bgg Id:</Col>
                <Col xs="6">{game?.bgg_id}</Col>
            </Row>
            <Row>
                <Col xs="6">Game Type:</Col>
                <Col xs="6" style={{textTransform: 'capitalize'}}>{game?.game_type}</Col>
            </Row>
        </Container>
    );
}

export default Index;