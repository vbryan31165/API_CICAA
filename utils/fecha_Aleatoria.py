import random
from datetime import datetime, timedelta


def fecha_random():
    inicio = datetime.strptime("31-01-2022 07:00:00", "%d-%m-%Y %H:%M:%S")
    final = datetime.strptime("31-12-2022 21:59:00", "%d-%m-%Y %H:%M:%S")

    # print(inicio)
    # print(final)

    random_date = inicio + (final - inicio) * random.random()
    micro = random_date.microsecond
    # print("ramdom ---------->",random_date)
    # print("micro", micro)

    fecha_aleatoria = random_date - timedelta(microseconds=micro)
    return fecha_aleatoria

def usuario_salon_estado_ramdom():

    usuario = random.randint(1, 6)
    salon = random.randint(1, 10)
    estado = random.randint(0, 1)
    # print(usuario)

    return usuario, salon, estado


# data=usuario_salon_estado_ramdom()

# print(data)
# print(data[1])
