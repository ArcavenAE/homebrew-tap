class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260801.014248.d9894ce"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-014248-d9894ce/marvel-darwin-arm64"
    sha256 "b80218dd07822c96e208a6efd55340aa2e0909e82be2aed15732cf7a253f2a72"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-014248-d9894ce/marvel-darwin-amd64"
    sha256 "a4dc2e60ad103e55b9da245c528d0fe7ae06ee1659011065dd9c7558919dba63"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-014248-d9894ce/marvel-linux-arm64"
    sha256 "d5e349e49b534eb5c167982a85eaf612daab31f42334f81fc9507a8e746680f8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-014248-d9894ce/marvel-linux-amd64"
    sha256 "8f795ed0910abfe5d687ed9368d75377a8b4be81efb924db61300bcd5c10af70"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
