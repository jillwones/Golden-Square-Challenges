require 'FinishMyOrder'

describe FinishMyOrder do 
  context 'when initialising' do 
    it 'creates an instance of FinishMyOrder' do 
      fake_order = double(:order, order: [['burger', 4.5], ['chips', 2.0]])
      finish_my_order = FinishMyOrder.new(fake_order, Kernel)
      expect(finish_my_order).to be_an_instance_of(FinishMyOrder)
    end
  end

  describe '#receipt' do 
    it 'prints the receipt for the order' do 
      fake_order = double(:order, order: [['burger', 4.5], ['chips', 2.0]])
      terminal = double(:terminal)
      expect(terminal).to receive(:puts).with('What you ordered:')
      expect(terminal).to receive(:puts).with('burger - £4.50')
      expect(terminal).to receive(:puts).with('chips - £2.00')
      expect(terminal).to receive(:puts).with('Grand Total: £6.50')
      finish_my_order = FinishMyOrder.new(fake_order, terminal)
      finish_my_order.receipt
    end
  end

  describe '#send_text' do 
    # it 'sends a confirmation text to the user that order will arrive in 20 minutes from now' do 
      # sends text, not quite sure how to test this yet
    # end
  end
end