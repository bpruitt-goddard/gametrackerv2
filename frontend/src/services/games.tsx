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