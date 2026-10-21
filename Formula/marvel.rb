class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.173634.8b87171"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-173634-8b87171/marvel-darwin-arm64"
    sha256 "c9e17787599ed6b6925e7b52714304574c825a70ca419e84779c9477fb298005"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-173634-8b87171/marvel-darwin-amd64"
    sha256 "25be7441529d47f32245b29dd2ebc2101a14199384499df70e453770d91dcdd5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-173634-8b87171/marvel-linux-arm64"
    sha256 "30553ff1585dc84b59b91ee125b4bd4442c71743d8dcc966d6cbaa1e18920abb"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-173634-8b87171/marvel-linux-amd64"
    sha256 "090b0023a7e50299effec6e65bcc7a3eaa81152d156675663db7f46ddc035ece"
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
