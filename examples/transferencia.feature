# language: es
# Otro dominio, el mismo método: un banco. Las reglas de negocio se verifican con valores
# exactos, y la trazabilidad de auditoría es parte del comportamiento, no un detalle técnico.
Característica: Transferencia entre cuentas propias

  Antecedentes:
    Dado un cliente "Ana" con una cuenta corriente con saldo 100000
    Y una cuenta de ahorro con saldo 0

  Escenario: Una transferencia mueve el monto exacto y queda registrada
    Cuando "Ana" transfiere 25000 de la cuenta corriente a la de ahorro
    Entonces la cuenta corriente queda con saldo 75000
    Y la cuenta de ahorro queda con saldo 25000
    Y el registro de auditoría tiene 1 movimiento de 25000 a nombre de "Ana"

  Escenario: Sin saldo suficiente no se mueve nada
    Cuando "Ana" transfiere 150000 de la cuenta corriente a la de ahorro
    Entonces ve el mensaje "Saldo insuficiente"
    Y la cuenta corriente sigue con saldo 100000
    Y el registro de auditoría no tiene movimientos
