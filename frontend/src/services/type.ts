export interface IGame {
    id: number;
    name: string;
    bgg_id: number;
    game_type: GameType;
}

export enum GameType {
    cooperative = "cooperative",
    competitive = "competitive",
    mixed = "mixed"
}