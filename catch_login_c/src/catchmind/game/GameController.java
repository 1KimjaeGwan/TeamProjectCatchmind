package catchmind.game;

import java.net.URL;
import java.util.Optional;
import java.util.ResourceBundle;

import catchmind.main.ClientMain;
import catchmind.vo.ChatVO;
import catchmind.vo.PaintVO;
import javafx.application.Platform;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.control.ProgressBar;
import javafx.scene.control.Slider;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.media.Media;
import javafx.scene.media.MediaPlayer;
import javafx.scene.paint.Color;
import javafx.util.Duration;

public class GameController implements Initializable , GameInterface{
	//-----그림 그리는 것과 관련된 fx:id값들-----
	@FXML private Canvas canvas;
	@FXML private Button btnClose, btnClear, btnEraser, btnStart,
						 btnBlack, btnRed, btnGreen, btnBlue, btnYellow;
	@FXML private Slider slider;
	@FXML private ProgressBar timer;
	@FXML private Label lblAnswer;
	//******그림 그리는 것과 관련된 fx:id값들*******
	
	//-----채팅 과 관련된 fx:id값들-----
	@FXML private Button btnEnter;
	@FXML private TextField chatArea;
	@FXML private TextArea chatResult;
	@FXML private ListView userList;
	//******채팅 과 관련된 fx:id값들*******
	
	//-----그림그리는 관련 필드 -----
	GraphicsContext gc;
	private int color = 0;// 기본값 0 번 검정
	private double thickness = 1; // 기본값  굴기 1 
	//******그림그리는 관련 필드******
	
	//----- 배경음악관련 fx:id값들 --------
	@FXML private Button muPlay, muStop, muPause;
	//***** 배경음악관련 fx:id값들 **********
	
	//----- 배경음악관련 필드 ---------
	private boolean endOfMedia; // 파일의 끝까지 재생 완료를 확인할 flag
	private Media media;		// 재생해야할 resource 정보를 저장하는 객체
	private MediaPlayer mediaPlayer; // button을 통해 재생되는 resource를 제어하는 객체
	//****** 배경음악관련 필드***********
	
	
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		ClientMain.thread.gameController = this; //뭔진 모르겠는데 안꼬일려면 해야됨
		
//---------------------------------그림그리는 관련------------------------
		gc = canvas.getGraphicsContext2D();
		gc.setStroke(Color.BLACK);	
		gc.setLineWidth(1);			
		
		slider.setMin(1);	
		slider.setMax(100);
		
		canvas.setOnMousePressed(event->{
			double x = event.getX();
			double y = event.getY();
			PaintVO paint = new PaintVO(x,y);
			paint.setSignal(2);
			paint.setColor(color);
			paint.setThickness(thickness);
			ClientMain.thread.sendData(paint);
		});
		
		canvas.setOnMouseDragged(event->{
			double x = event.getX();
			double y = event.getY();
			PaintVO paint = new PaintVO(x,y);
			paint.setSignal(3);
			paint.setColor(color);
			paint.setThickness(thickness);
			ClientMain.thread.sendData(paint);
		});
		btnClear.setOnAction(event->{
			PaintVO paint = new PaintVO();
			paint.setSignal(1);
			ClientMain.thread.sendData(paint);
		});
		
		btnStart.setOnAction(event->{
			
		});
		
		btnStart.setOnAction(event->{
			
		});
		
		btnBlack.setOnAction(e->{
			color = 0;
		});
		
		
		btnRed.setOnAction(e->{
			color = 1;
		});
		
		btnYellow.setOnAction(e->{
			color = 2;
		});
		
		btnBlue.setOnAction(e->{
			color = 3;
		});
		
		btnGreen.setOnAction(e->{
			color = 4;
		});
		
		btnEraser.setOnAction(e->{
			color = 5;
		});
			


		slider.valueProperty().addListener((ob,oldValue,newValue)->{
			int value = newValue.intValue();
			thickness = value/5 + 1;
		});
//****************************그림그리는 관련 ******************************


//----------------------------채팅 관련 ----------------------------------
		btnEnter.setOnAction(event->{
			ChatVO chat = new ChatVO();
		});
		
//****************************채팅 관련 **********************************
		
		//종료 버튼 액션 
		btnClose.setOnAction(event->{
			Alert alert = new Alert(AlertType.CONFIRMATION); 
			alert.setTitle("게임 종료"); 
			alert.setHeaderText("잠깐! 게임을 종료하시겠습니까?"); 
			alert.setContentText("OK 버튼 클릭 시 게임 종료됩니다."); 
			Optional<ButtonType> result = alert.showAndWait();
			if(result.get() ==  ButtonType.OK) {
				Platform.exit();
			}
		});
		
//---------------------------- 배경음악 관련 ------------------------------
//		media = new Media(
//			getClass().getResource("../BGM.mp3").toString()	
//		);
//		init(media);
//	}
//	
//	private void init(Media media) {
//		if(mediaPlayer != null) {
//			mediaPlayer.stop();
//			mediaPlayer = null;
//		}
//		
//		mediaPlayer = new MediaPlayer(media);
//		
//		// 재생버튼을 통해 음악실행
//		muPlay.setOnAction(event->{
//			if(endOfMedia) {
//				mediaPlayer.stop();
//			}
//			endOfMedia = false;
//			mediaPlayer.play();
//		});
//		
//		muPause.setOnAction(event->{
//			mediaPlayer.pause();
//		});
//		
//		muStop.setOnAction(event->{
//			mediaPlayer.stop();
//		});
//		
//	}
//	// MediaPlayer 초기화
//	public void setMediaPlayer() {
//		// 재생 준비가 완료 되었을때
//		mediaPlayer.setOnReady(new Runnable() {
//			@Override
//			public void run() {
//				muPlay.setDisable(false);
//				muPause.setDisable(true);
//				muStop.setDisable(true);
//			}
//		});
//	
//		// play 상태 일때
//		mediaPlayer.setOnPlaying(()->{
//			muPlay.setDisable(true);
//			muPause.setDisable(false);
//			muStop.setDisable(false);
//		});
//			
//		// 일시 정지
//		mediaPlayer.setOnPaused(()->{
//			muPlay.setDisable(false);
//			muPause.setDisable(true);
//			muStop.setDisable(false);
//		});
//			
//		// endOfFile
//		mediaPlayer.setOnEndOfMedia(()->{
//			endOfMedia = true;
//			muPlay.setDisable(false);
//			muPause.setDisable(true);
//			muStop.setDisable(true);
//		});
//			
//		// 중지 Stop
//		mediaPlayer.setOnStopped(()->{
//			// mediaPlayer에 등록된 미디어의 재생 시작 시간을 가져옴
//			Duration duration = mediaPlayer.getStartTime();
//			// 재생시간을 설정하는 method
//			mediaPlayer.seek(duration);
//			muPlay.setDisable(false);
//			muPause.setDisable(true);
//			muStop.setDisable(true);
//		});
	}
//**************************** 배경음악 관련 ******************************
	
	@Override
	public void receiveData(PaintVO vo) {
		//signal == 1 캔버스 초기화
		if(vo.getSignal() == 1) {
			resetCanvas();//실행 resetCanvas()
		}
		//signal == 2 마우스 클릭

		if(vo.getSignal() == 2) {
			System.out.println("클릭 전달");
			painting(vo);
		}
		//signal == 3 마우스 드래그
		if(vo.getSignal() == 3) {
			System.out.println("드래그 전달");
			painting(vo);
		}
		
	}
	@Override
	public void painting(PaintVO vo) {
				
				Color penColor = Color.BLACK;
				switch(vo.getColor()) {
				case 0 : penColor = Color.BLACK; break;
				case 1 : penColor = Color.RED; break;
				case 2 : penColor = Color.YELLOW; break;
				case 3 : penColor = Color.BLUE; break;
				case 4 : penColor = Color.GREEN; break;
				case 5 : penColor = Color.WHITE; break;
				}
				gc.setStroke(penColor);
				gc.setLineWidth(vo.getThickness());
				if(vo.getSignal() == 2) {
					gc.beginPath();	//선그리기 시작
					gc.lineTo(vo.getX(),vo.getY());
				}else if (vo.getSignal() == 3) {
					gc.lineTo(vo.getX(), vo.getY());
					gc.stroke();
				}
			
	}
	@Override
	public void resetCanvas() {
		gc.clearRect(0, 0, canvas.getWidth(), canvas.getHeight());
	}


	
		
	
	
	
}
