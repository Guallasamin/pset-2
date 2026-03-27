import pandas as pd

if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@data_loader
def load_data(*args, **kwargs):

    year = 2021
    month = '01'

    url_csv = 'https://d37ci6vzurychx.cloudfront.net/misc/taxi_zone_lookup.csv'

    print('Inicio de descarga de datos...')
    zonas = pd.read_csv(
        url_csv,
    )

    print(f'Datos descargados con forma: {zonas.shape}')

    return zonas


@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'
