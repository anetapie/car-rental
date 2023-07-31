import random


names = [
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


last_names = [
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

print("client_id; name; last_name; age; tel_number; credit_card_no; pesel")

used_tel_number = []
used_credit_card_no = []


def generate_number(used, start, stop):
    while True:
        number = random.randint(start, stop)
        if number not in used:
            used.append(number)
            return number

client_table = ""
rent_table = ""


for i in range(200):
    age = random.randint(18, 65)

    client_table += (
        str(i+1)
        + "; "
        + names[random.randint(0, 99)]
        + "; "
        + last_names[random.randint(0, 99)]
        + "; "
        + str(age)
        + "; "
        + str(generate_number(used_tel_number, 200000000, 999999999))
        + "; "
        + str(
            generate_number(used_credit_card_no, 1111111111111111, 9999999999999999)
        )
        + "; "
        + "%02d" % ((2022 - age) % 100)
        + "%02d" % (random.randint(1, 12))
        + "%02d" % (random.randint(1, 28))
        + str(random.randint(10000, 99999))
    )

text_file = open("C:/projekt_3/client.sql", "w")
n = text_file.write(client_table)
text_file.close()
