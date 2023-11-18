// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CadenaSuministro {
    address public owner;

    struct Producto {
        uint256 id;
        string nombre;
        string lugarOrigen;
        bool autentico;
    }

    mapping(uint256 => Producto) public productos;

    modifier soloPropietario() {
        require(msg.sender == owner, "No autorizado");
        _;
    }

    event ProductoVerificado(uint256 indexed id, bool autentico);

    constructor() {
        owner = msg.sender;
    }

    function agregarProducto(uint256 id, string memory nombre, string memory lugarOrigen) public soloPropietario {
        productos[id] = Producto(id, nombre, lugarOrigen, false);
    }

    function verificarProducto(uint256 id) public returns (bool) {
        require(productos[id].id != 0, "Producto no encontrado");

        productos[id].autentico = true;

        emit ProductoVerificado(id, true);

        return true;
    }
}
