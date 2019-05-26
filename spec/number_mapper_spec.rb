require_relative '../lib/number_mapper'

RSpec.describe NumberMapper do
  let(:subject) { NumberMapper.new(number: 6_686_787_825) }

  describe 'Instance Methods' do
    describe '#initialize' do
      it 'writes errors as empty Hash' do
        expect(subject.errors).to be_an_instance_of(Hash)
        expect(subject.errors).to be_empty
      end

      it 'writes word_combinations as empty array' do
        expect(subject.word_combinations).to be_an_instance_of(Array)
        expect(subject.word_combinations).to be_empty
      end

      context 'writes number' do
        context 'when number argument is number' do
          let(:number_mapper) { NumberMapper.new(number: 1234) }
          it 'writes number as string for provided number' do
            expect(number_mapper.number).to be_an_instance_of(String)
            expect(number_mapper.number).to eql('1234')
          end
        end

        context 'when number argument is string' do
          let(:number_mapper) { NumberMapper.new(number: '123') }
          it 'writes number with provided string' do
            expect(number_mapper.number).to be_an_instance_of(String)
            expect(number_mapper.number).to eql('123')
          end
        end

        context 'when number argument is missing' do
          let(:number_mapper) { NumberMapper.new }
          it 'writes number as empty string' do
            expect(number_mapper.number).to be_an_instance_of(String)
            expect(number_mapper.number).to be_empty
          end
        end
      end
    end

    describe '#search_word_combinations' do
      context 'when number is valid' do
        it 'returns possible combinations of words for gives number' do
          expect(
            subject.search_word_combinations
          ).to include(
            'MOTORTRUCK',
            'MOTOR,TRUCK',
            'MOTOR,USUAL',
            'NOUN,STRUCK',
            'NOT,OPT,PUCK'
          )

          expect(
            NumberMapper.new(number: 2_282_668_687).search_word_combinations
          ).to include(
            'CATAMOUNTS',
            'ACTA,MOUNTS',
            'ACT,AMOUNTS',
            'ACT,CONTOUR',
            'CAT,BOOT,OUR'
          )
        end
      end

      context 'when number is invalid' do
        it 'returns error message' do
          expect(NumberMapper.new.search_word_combinations).to eql(
            'Number should not be blank.'
          )
        end
      end
    end

    describe '#word_exists?' do
      context 'word exists in dictionary' do
        context 'when word have mixed case characters' do
          it { expect(subject.word_exists?('aaL')).to be_eql(true) }
        end

        context 'when word have lower case characters' do
          it { expect(subject.word_exists?('aal')).to be_eql(true) }
        end

        context 'when word have upper case characters' do
          it { expect(subject.word_exists?('AAL')).to be_eql(true) }
        end
      end

      context 'word do exists in dictionary' do
        it { expect(subject.word_exists?('Google')).to be_eql(false) }
      end
    end

    describe '#valid_number?' do
      context 'when word is valid' do
        context 'when number is empty' do
          let(:number_mapper) { NumberMapper.new }

          it { expect(number_mapper.valid_number?).to be_eql(false) }

          it 'set errors to - `Number should not be blank.`' do
            number_mapper.valid_number?

            expect(number_mapper.errors[:number]).to be_eql(
              'Number should not be blank.'
            )
          end
        end

        context 'when number do not have only digits' do
          let(:number_mapper) { NumberMapper.new(number: '2323A2323') }

          it { expect(number_mapper.valid_number?).to be_eql(false) }

          it 'set errors to - `Number should not be blank.`' do
            number_mapper.valid_number?

            expect(number_mapper.errors[:number]).to be_eql(
              'Number should contain only Digits.'
            )
          end
        end

        context 'when number contains digits not mapped with alphabets' do
          let(:number_mapper) { NumberMapper.new(number: '1223') }

          it { expect(number_mapper.valid_number?).to be_eql(false) }

          it 'set errors to - `Number should not be blank.`' do
            number_mapper.valid_number?

            expect(number_mapper.errors[:number]).to be_eql(
              'Number should contain Digits(2, 3, 4, 5, 6, 7, 8, 9) mapped with Alphabets.'
            )
          end
        end
      end

      context 'when word is invalid' do
        it { expect(subject.valid_number?).to eql(true) }
      end
    end
  end
end
