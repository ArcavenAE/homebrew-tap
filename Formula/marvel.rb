class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261014.180818.3188a08"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-180818-3188a08/marvel-darwin-arm64"
    sha256 "1814cfa8156d321990d9658ac6f4da2532ae1ad3468fbf3d1537ab65a3ed6de6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-180818-3188a08/marvel-darwin-amd64"
    sha256 "16f8a396e1043d3903adbc20b8e1b9764e233b9f45f3892bdef5e12f273861a7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-180818-3188a08/marvel-linux-arm64"
    sha256 "46083035d9d0d18db272940f67641fac7ad9adbee08657db3dead1684cfd94cf"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-180818-3188a08/marvel-linux-amd64"
    sha256 "ce6fbe5926884f402626cc9bd36ef521e8c47d4d27ffa6a6ed44b096636496de"
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
