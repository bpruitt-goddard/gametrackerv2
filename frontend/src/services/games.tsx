import { IGame } from "./type";

const apiBase ='http://localhost:3100'

export async function getGames<TGame>(): Promise<TGame> {
    const response = await fetch(`${apiBase}/games`, {
        mode: 'cors'
    });
    if (!response.ok) {
        throw new Error(response.statusText);
    }
    return await (response.json() as Promise<TGame>);
}

export async function getGame<TGame>(id : number): Promise<TGame> {
    const response = await fetch(`${apiBase}/games/${id}`, {
        mode: 'cors'
    });
    if (!response.ok) {
        throw new Error(response.statusText);
    }
    return await (response.json() as Promise<TGame>);
}

export async function createGame<TGame>(game: TGame): Promise<TGame> {
    const response = await fetch(`${apiBase}/games`, {
        method: 'POST',
        mode: 'cors',
        body: JSON.stringify(game)
    });
    if (!response.ok) {
        throw new Error(response.statusText);
    }
    return await (response.json() as Promise<TGame>);
}

export async function updateGame(game: IGame): Promise<IGame> {
    const response = await fetch(`${apiBase}/games/${game.id}`, {
        method: 'PUT',
        mode: 'cors',
        body: JSON.stringify(game)
    });
    if (!response.ok) {
        throw new Error(response.statusText);
    }
    return await (response.json() as Promise<IGame>);
}