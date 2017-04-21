class HistoryController < ApplicationController
  authorize_resource :class => false
  def index
    @versions = PaperTrail::Version.order('created_at DESC').page(params[:version_page]).per(250)
    unless params[:show_result_versions]=='true'
      @versions = @versions.where.not(item_type: ["Result"])
    end
    unless params[:version_type].blank?
      @versions = @versions.where(item_type: params[:version_type])
    end
    unless params[:version_event].blank?
      @versions = @versions.where(event: params[:version_event])
    end
    @version_user_ids = PaperTrail::Version.select("whodunnit, count(whodunnit) cnt").group("whodunnit").reject{|v| v.whodunnit.blank?}.map{|v| ["#{User.find_by(id: v.whodunnit).try(:email)||'NA'} - #{v.cnt}",v.whodunnit]}
    unless params[:version_user].blank?
      @versions = @versions.where(whodunnit: params[:version_user])
    end
  end
end