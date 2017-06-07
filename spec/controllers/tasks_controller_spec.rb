require 'rails_helper'

describe TasksController, type: :controller do
  describe 'GET index.pdf' do
    describe 'response' do
      subject { get :index, params: { format: 'pdf' } }
      before  { create_task_list 1 }

      it { expect(subject).to be_success }
      it { expect(subject.content_type).to eq('application/pdf') }
      it { expect(subject.header['Content-Disposition']).to include('tasks.pdf') }
    end

    describe 'pdf data' do
      before do
        create_task_list 30
        get :index, params: { format: 'pdf' }
      end

      describe 'contents' do
        subject { PDF::Inspector::Text.analyze(response.body).strings }
        it { expect(subject.grep(/#\d+/).count).to eq(30) }
      end

      describe 'pages' do
        subject { PDF::Inspector::Page.analyze(response.body).pages }
        it { expect(subject.count).to eq(2) }
      end
    end
  end

  describe 'GET show/1.pdf' do
    describe 'response' do
      subject { get :show, params: { id: create_task.id, format: :pdf } }

      it { expect(subject).to be_success }
      it { expect(subject.content_type).to eq('application/pdf') }
    end

    describe 'pdf data' do
      render_views

      before { get :show, params: { id: task.id, format: :pdf } }

      let(:task) { create_task name: 'Foo', done: true, due_date: Time.zone.local(2017, 1, 1) }

      describe 'contents' do
        subject { PDF::Inspector::Text.analyze(response.body).strings }
        it { expect(subject).to include('Foo', 'done', '2017-01-01') }
      end

      describe 'pages' do
        subject { PDF::Inspector::Page.analyze(response.body).pages }
        it { expect(subject.count).to eq(1) }
      end
    end
  end

  def create_task_list(count = 1, **attrs)
    count.times { create_task(attrs) }
  end

  def create_task(**attrs)
    Task.create(attrs)
  end
end
