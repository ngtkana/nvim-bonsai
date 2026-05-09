import requests


def main():
    # requests.で補完が効くかテスト
    response = requests.get("https://api.github.com")
    print(f"Status: {response.status_code}")

    # response.で補完が効くかテスト


if __name__ == "__main__":
    main()
