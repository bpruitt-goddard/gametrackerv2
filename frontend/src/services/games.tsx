import { IGame } from "./type";

const apiBase ='http://localhost:3100'

export async function getGames(): Promise<IGame[]> {
    const response = await fetch(`${apiBase}/games`, {
        mode: 'cors'
    });
    if (!response.ok) {
        throw new Error(response.statusText);
    }
    return await (response.json() as Promise<IGame[]>);
}

export async function getGame(id : number): Promise<IGame> {
    const response = await fetch(`${apiBase}/games/${id}`, {
        mode: 'cors'
    });
    if (!response.ok) {
        throw new Error(response.statusText);
    }
    return await (response.json() as Promise<IGame>);
}

export async function createGame(game: IGame): Promise<IGame> {
    const response = await fetch(`${apiBase}/games`, {
        method: 'POST',
        mode: 'cors',
        body: JSON.stringify(game)
    });
    if (!response.ok) {
        throw new Error(response.statusText);
    }
    return await (response.json() as Promise<IGame>);
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