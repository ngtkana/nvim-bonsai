import numpy as np
import pandas as pd


def main():
    # numpy配列を作成
    arr = np.array([1, 2, 3, 4, 5])
    print(f"Array: {arr}")
    print(f"Mean: {arr.mean()}")

    # DataFrameを作成
    df = pd.DataFrame({
        'name': ['Alice', 'Bob', 'Charlie'],
        'age': [25, 30, 35]
    })
    print(df)

    # arr.で補完が効くかテスト
    # df.で補完が効くかテスト


if __name__ == "__main__":
    main()
