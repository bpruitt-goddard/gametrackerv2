export async function getGames<TGame>(): Promise<TGame> {
    const response = await fetch('http://localhost:3100/games', {
        mode: 'cors'
    });
    if (!response.ok) {
        throw new Error(response.statusText);
    }
    return await (response.json() as Promise<TGame>);
}