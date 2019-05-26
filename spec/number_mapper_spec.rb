require_relative '../lib/number_mapper'

RSpec.describe NumberMapper do
  let(:subject) { NumberMapper.new }

  describe 'Instance Methods' do
    describe '#search_word_combinations' do
      it 'returns possible combinations of words for gives number' do
        expect(
          subject.search_word_combinations(6_686_787_825)
        ).to include(
          'MOTORTRUCK',
          'MOTOR,TRUCK',
          'MOTOR,USUAL',
          'NOUN,STRUCK',
          'NOT,OPT,PUCK'
        )

        expect(
          NumberMapper.new.search_word_combinations(2_282_668_687)
        ).to include(
          'CATAMOUNTS',
          'ACTA,MOUNTS',
          'ACT,AMOUNTS',
          'ACT,CONTOUR',
          'CAT,BOOT,OUR'
        )
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
  end
end
