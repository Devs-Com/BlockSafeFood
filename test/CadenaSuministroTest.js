const CadenaSuministro = artifacts.require('CadenaSuministro')

contract('CadenaSuministro', accounts => {
    it('debería permitir agregar un producto', async () => {
        const cadenaSuministroInstance = await CadenaSuministro.deployed()

        // Ejecutamos la función de registro
        await cadenaSuministroInstance.agregarProducto(0, 'Producto1', 'Lugar1', { from: accounts[0] })

        // Recuperamos información y realiza afirmaciones
        const producto = await cadenaSuministroInstance.productos(0)

        assert.equal(producto.nombre, 'Producto1', 'El nombre del producto no coincide')
    })
})
