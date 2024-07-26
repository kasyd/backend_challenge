# Purpose: Migration to create the cities table in the database.
class CreateCities < ActiveRecord::Migration[5.0]
  def up # rubocop:disable Metrics/MethodLength
    create_table :cities do |t|
      t.string :name
      t.integer :population
      t.references :state, foreign_key: true
    end

    execute "
    INSERT INTO cities (name, population, state_id) VALUES
    ('Curitiba','1773718', '1'),
    ('Londrina','555965', '1'),
    ('Maringá','409657', '1'),
    ('Ponta Grossa','358371', '1'),
    ('Cascavel','348051', '1'),
    ('São José dos Pinhais','329628', '1'),
    ('Foz do Iguaçu','285415', '1'),
    ('Colombo','232212', '1'),
    ('Guarapuava','182093', '1'),
    ('Araucária','151666', '1'),
    ('Toledo','150470', '1'),
    ('Fazenda Rio Grande','148873', '1'),
    ('Paranaguá','145829', '1'),
    ('Campo Largo','136327', '1'),
    ('Apucarana','130134', '1'),
    ('Pinhais','127019', '1'),
    ('Almirante Tamandaré','119825', '1'),
    ('Arapongas','119138', '1'),
    ('Piraquara','118730', '1'),
    ('Sarandi','118455', '1'),
    ('Joinville','616317', '2'),
    ('Florianópolis','537211', '2'),
    ('Blumenau','361261', '2'),
    ('São José','270299', '2'),
    ('Itajaí','264054', '2'),
    ('Chapecó','254785', '2'),
    ('Palhoça','222598', '2'),
    ('Criciúma','214493', '2'),
    ('Jaraguá do Sul','182660', '2'),
    ('Lages','164981', '2'),
    ('Brusque','141385', '2'),
    ('Balneário Camboriú','139155', '2'),
    ('Tubarão','110088', '2'),
    ('Camboriú','103074', '2'),
    ('Navegantes','86401', '2'),
    ('São Bento do Sul','83277', '2'),
    ('Concórdia','81646', '2'),
    ('Biguaçu','76773', '2'),
    ('Itapema','75940', '2'),
    ('Caçador','73720', '2'),
    ('Porto Alegre','1332570', '3'),
    ('Caxias do Sul','463338', '3'),
    ('Canoas','347657', '3'),
    ('Pelotas','325689', '3'),
    ('Santa Maria','271633', '3'),
    ('Gravataí','265070', '3'),
    ('Novo Hamburgo','227732', '3'),
    ('Viamão','224116', '3'),
    ('São Leopoldo','217410', '3'),
    ('Passo Fundo','206224', '3'),
    ('Rio Grande','191900', '3'),
    ('Alvorada','187315', '3'),
    ('Cachoeirinha','136258', '3'),
    ('Santa Cruz do Sul','133230', '3'),
    ('Sapucaia do Sul','132107', '3'),
    ('Bento Gonçalves','123151', '3'),
    ('Bagé','117938', '3'),
    ('Uruguaiana','117210', '3'),
    ('Erechim','105705', '3'),
    ('Lajeado','93646', '3')
    "
  end

  def down
    drop_table :cities
  end
end
