import random, datetime, os

ROOT_PATH = os.path.dirname(os.path.realpath(__file__))

DATA_PATH = os.path.join(ROOT_PATH, "data")

NAMES = [
    "Zachariasz",
    "Kasjusz",
    "Dominik",
    "Sofroniusz",
    "Natanael",
    "Radomira",
    "Korneli",
    "Anetta",
    "Achilles",
    "Adrian",
    "Roch",
    "Marcjanna",
    "Dionizy",
    "Ksawera",
    "Marian",
    "Hipolita",
    "Władysław",
    "Barnaba",
    "Longin",
    "Keiria",
    "Strzeżymira",
    "Morzana",
    "Gotard",
    "Radomił",
    "Ignacy",
    "Hiacynt",
    "Lejla",
    "Dalmira",
    "Ksenia",
    "Murat",
    "Celina",
    "Szymon",
    "Delia",
    "Lora",
    "Abelard",
    "Wiesława",
    "Kamira",
    "Machut",
    "Alan",
    "Domasław",
    "Hasan",
    "Sulisław",
    "Linda",
    "Wiesław",
    "Manfred",
    "Izaura",
    "Olaf",
    "Sergiusz",
    "Leonard",
    "Daria",
    "Edmund",
    "Dalbor",
    "Starwit",
    "Lubisław",
    "Sędomir",
    "Pachomiusz",
    "Grodzisław",
    "Nitara",
    "Kemal",
    "Bolelut",
    "Aldona",
    "Agapit",
    "Ildefons",
    "Karina",
    "Estera",
    "Donald",
    "Przemysława",
    "Stela",
    "Sandra",
    "Oksana",
    "Miłobąd",
    "Jarowit",
    "Lenart",
    "Macieja",
    "Konstantyn",
    "Filipina",
    "Babeta",
    "Tomasz",
    "Sędzisława",
    "Julia",
    "Miłorad",
    "Eliza",
    "Marta",
    "Tobiasz",
    "Emanuela",
    "Augustyna",
    "Wioleta",
    "Iwo",
    "Jolanta",
    "Lucjana",
    "Witosław",
    "Wincentyna",
    "Rozalia",
    "Najsława",
    "Lila",
    "Kajetan",
    "Iliana",
    "Miłowan",
    "Teofila",
    "Greta",
]


LAST_NAMES = [
    "Ścisłowski",
    "Zientek",
    "Sułek",
    "Ślusarczyk",
    "Malczyk",
    "Ilczuk",
    "Kasiński",
    "Cywiński",
    "Lipczyński",
    "Czechowski",
    "Rożek",
    "Szymczak",
    "Cios",
    "Jordan",
    "Cabaj",
    "Łapka",
    "Studziński",
    "Kała",
    "Drabek",
    "Koryciński",
    "Mączka",
    "Magnuszewski",
    "Janczyk",
    "Chabowski",
    "Jurecki",
    "Gacek",
    "Zabłocki",
    "Wiktorowicz",
    "Chmura",
    "Lenard",
    "Tęcza",
    "Garbarczyk",
    "Stencel",
    "Papież",
    "Nowowiejski",
    "Puk",
    "Ławecki",
    "Obara",
    "Murzyn",
    "Buła",
    "Czyżewski",
    "Rosa",
    "Sawczuk",
    "Tucholski",
    "Fil",
    "Strzałka",
    "Włodarski",
    "Brych",
    "Jaros",
    "Soja",
    "Sówka",
    "Pietrasik",
    "Rynkiewicz",
    "Łucki",
    "Pietrzykowski",
    "Kozielski",
    "Płaza",
    "Waś",
    "Sternik",
    "Sus",
    "Kruczek",
    "Kraśniewski",
    "Derkowski",
    "Harasimowicz",
    "Kobus",
    "Szarzyński",
    "Tworkowski",
    "Glapa",
    "Stolarek",
    "Komenda",
    "Polaczek",
    "Mielniczuk",
    "Kopciński",
    "Kusak",
    "Brzezina",
    "Siwak",
    "Juda",
    "Józefiak",
    "Najder",
    "Zembrzuski",
    "Łada",
    "Lipski",
    "Gajdziński",
    "Płatek",
    "Mendyk",
    "Polewski",
    "Barcik",
    "Kilian",
    "Domeracki",
    "Klim",
    "Stefańczyk",
    "Małolepsza",
    "Jędras",
    "Blicharski",
    "Frączak",
    "Wolniewicz",
    "Kluczyński",
    "Cyran",
    "Weiss",
    "Fijał",
]


# client id 1-200
# city id 1-8
# emplyee id 1-17
# car id 1-157


def generate_number(used, start, stop):
    while True:
        number = random.randint(start, stop)
        if number not in used:
            used.append(number)
            return number


def create_client():
    client_table = ""

    used_tel_number = []
    used_credit_card_no = []

    for i in range(200):
        age = random.randint(18, 65)

        pesel = (
            "%02d" % ((2022 - age) % 100)
            + "%02d" % (random.randint(1, 12))
            + "%02d" % (random.randint(1, 28))
            + str(random.randint(10000, 99999))
        )

        client_table += (
            f"{str(i+1)};{NAMES[random.randint(0, 99)]};{LAST_NAMES[random.randint(0, 99)]};"
            + f"{age};{generate_number(used_tel_number, 200000000, 999999999)};"
            + f"{generate_number(used_credit_card_no, 1111111111111111, 9999999999999999)};{pesel}\n"
        )

    text_file = open(os.path.join(DATA_PATH, "client.txt"), "w", encoding="utf-8")
    text_file.write(client_table)
    text_file.close()


def create_employee():
    employee_table = ""

    empoyee_id_city_id = {}

    for i in range(20):
        id = i + 1
        city_id = random.randint(1, 8)
        department = generate_department()

        employee_table += (
            f"{id};{NAMES[random.randint(0, 99)]};{LAST_NAMES[random.randint(0, 99)]};"
            + f"{department};{city_id}\n"
        )

        empoyee_id_city_id[id] = city_id

    text_file = open(os.path.join(DATA_PATH, "employee.txt"), "w", encoding="utf-8")
    text_file.write(employee_table)
    text_file.close()

    return empoyee_id_city_id


def generate_department():
    employee_department = [
        "customer service",
        "receptionist",
        "project manager",
        "marketing manager",
    ]

    rand = random.randint(1, 100)

    if rand <= 60:
        return employee_department[0]
    if rand <= 80:
        return employee_department[1]
    if rand <= 85:
        return employee_department[2]
    return employee_department[3]


def create_rent(empoyee_id_city_id):
    rent_table = ""

    source_date_pickup = datetime.date(2022, 1, 1)

    pickup_dates = []

    for i in range(500):
        pickup_dates.append(
            source_date_pickup + datetime.timedelta(days=random.randint(0, 364))
        )

    pickup_dates.sort()

    for i in range(500):
        age = random.randint(18, 65)

        employee_id_pickup = random.randint(1, 20)
        city_id_pickup = empoyee_id_city_id[employee_id_pickup]
        employee_id_return = random.randint(1, 20)
        city_id_return = empoyee_id_city_id[employee_id_return]

        pickup_date = pickup_dates[i]
        return_date = pickup_date + datetime.timedelta(days=random.randint(1, 14))

        rent_table += (
            f"{str(i+1)};{random.randint(1, 200)};{random.randint(1, 157)};"
            + f"{employee_id_pickup};{employee_id_return};{city_id_pickup};{city_id_return};"
            + f"{pickup_date};{return_date}\n"
        )

    text_file = open(os.path.join(DATA_PATH, "rent.txt"), "w", encoding="utf-8")
    text_file.write(rent_table)
    text_file.close()


def get_car_class(horsepower_str):
    if horsepower_str == "":
        return "A"

    horsepower = int(horsepower_str)
    if horsepower > 200:
        return "C"
    if horsepower > 150:
        return "B"
    return "A"


def recreate_car():
    car_table = ""

    skip_line = True
    id = 1

    with open(os.path.join(ROOT_PATH, "data_downloaded", "car_sales.csv"), "r") as file:
        for line in file:
            if skip_line:
                skip_line = False
                continue

            splitted = line.rstrip().split(",")
            car_class = get_car_class(splitted[7])
            car_table += (
                str(id)
                + ";"
                + splitted[0]
                + ";"
                + splitted[1]
                + ";"
                + car_class
                + ";"
                + splitted[6]
                + ";"
                + splitted[7]
                + "\n"
            )
            id += 1

    text_file = open(os.path.join(DATA_PATH, "car.txt"), "w", encoding="utf-8")
    text_file.write(car_table)
    text_file.close()


def main():
    if not os.path.exists(DATA_PATH):
        os.mkdir(DATA_PATH)

    create_client()
    empoyee_id_city_id = create_employee()
    create_rent(empoyee_id_city_id)
    recreate_car()


if __name__ == "__main__":
    main()
