class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261102.005506.5c17737"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-005506-5c17737/marvel-darwin-arm64"
    sha256 "3b929ded01dbe288c0b147160ea6863e31572d325c330f8f650e09d7ac36f09e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-005506-5c17737/marvel-darwin-amd64"
    sha256 "212450c1f9712b381557f7a3187586347f44e98edc49331f3b528bb0dbdb8593"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-005506-5c17737/marvel-linux-arm64"
    sha256 "6a7ce9cedbda7de3e5d92e10a5c17f554803572195cd2cd699d93e6fc6f989b5"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-005506-5c17737/marvel-linux-amd64"
    sha256 "2f3020da658701341550f08f5421e97fda9727b035c5194ea62d4b5b0368df25"
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
