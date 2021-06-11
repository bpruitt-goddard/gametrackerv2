import { FC, useState } from 'react';
import { RouteComponentProps } from 'react-router-dom';
import { Col, Container, Row } from 'reactstrap';
import { IGame } from '../../services/type';

interface IGameProps {
    id: string;
}

const Index : FC<RouteComponentProps<IGameProps>> = props => {
    const { id } = props.match.params;
    const [game, setGame] = useState<IGame>({name: 'Gloom', id: 4, bgg_id: 123, game_type: 'competitive'});

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